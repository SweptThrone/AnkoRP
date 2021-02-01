-- i don't want to comment these right now
-- i have a headache

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Downgrade Station"
ENT.Author= "Throneco"
ENT.Contact= "http://discord.gg/Tg8SUDv"
ENT.Purpose= ""
ENT.Instructions= ""
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Throneco Stuff"

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end

    net.Receive( "ST_OpenDowngradeMenu", function()

        local this = net.ReadEntity()

        local UpgradeWindow = vgui.Create( "DFrame" )
        UpgradeWindow:SetPos( 5, 5 )
        UpgradeWindow:SetSize( 800, 400 )
        UpgradeWindow:SetTitle( "" )
        UpgradeWindow:SetVisible( true )
        UpgradeWindow:SetDraggable( false )
        UpgradeWindow:ShowCloseButton( false )
        UpgradeWindow:MakePopup()
        UpgradeWindow:Center()
        UpgradeWindow.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 21, 22, 49, 255 ) )
            draw.SimpleText( "DOWNGRADE STATION", "UPGMed", 5, 2 )
        end

        local CloseButton = vgui.Create( "DButton", UpgradeWindow )
        CloseButton:SetPos( 760, 0 )
        CloseButton:SetSize( 40, 20 )
        CloseButton:SetText( "X" )
        CloseButton:SetTextColor(Color(255,255,255))
        CloseButton.DoClick = function( self )
            UpgradeWindow:Close()
            surface.PlaySound("ui/buttonclick.wav")
        end
        CloseButton.Paint = function( self, w, h )
            if CloseButton:IsHovered() then
                draw.RoundedBox( 0, 0, 0, w, h, Color( 128, 0, 0, 255 ) )
            else
                draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 0, 0, 255 ) )
            end
            surface.SetDrawColor( color_black )
        end

        local WeaponLabel = vgui.Create( "DLabel", UpgradeWindow )
        WeaponLabel:SetPos( 0, 80 )
        WeaponLabel:SetFont( "UPGSmall" )
        
        if CSO_WEAPONS_TREE[ LocalPlayer():GetActiveWeapon():GetClass() ] == nil or CSO_WEAPONS_TREE[ LocalPlayer():GetActiveWeapon():GetClass() ].parent == "nil" then
            WeaponLabel:SetText( "Your " .. ( LocalPlayer():GetActiveWeapon():GetPrintName()[1] == "#" and language.GetPhrase( LocalPlayer():GetActiveWeapon():GetPrintName() ) or LocalPlayer():GetActiveWeapon():GetPrintName() ) .. " cannot be downgraded." )
            WeaponLabel:SizeToContents()
            WeaponLabel:CenterHorizontal()
        else
            WeaponLabel:SetText( "Would you like to downgrade your " .. LocalPlayer():GetActiveWeapon():GetPrintName() .. "?" )
            WeaponLabel:SizeToContents()
            WeaponLabel:CenterHorizontal()
            local UpgradedWeapon = vgui.Create( "DButton", UpgradeWindow )
            UpgradedWeapon:SetPos( 150, 180 )
            UpgradedWeapon:SetSize( 500, 30 )
            UpgradedWeapon:SetText( weapons.Get( CSO_WEAPONS_TREE[ LocalPlayer():GetActiveWeapon():GetClass() ].parent ).PrintName .. " - -" .. DarkRP.formatMoney( CSO_WEAPONS_TREE[ LocalPlayer():GetActiveWeapon():GetClass() ].price * 0.2 ) )
            UpgradedWeapon:SetFont( "UPGSmall" )
            UpgradedWeapon:SetTextColor( Color( 255, 255, 255 ) )
            UpgradedWeapon.class = v
            function UpgradedWeapon:Paint( w, h )
                if self:IsHovered() then
                    surface.SetDrawColor( Color( 128, 128, 128 ) )
                else
                    surface.SetDrawColor( Color( 255, 255, 255 ) )
                end
                surface.DrawOutlinedRect( 0, 0, w, h)
            end
            function UpgradedWeapon:DoClick()
                net.Start( "ST_DowngradeWeapon" )
                    net.WriteEntity( this )
                net.SendToServer()
                UpgradeWindow:Close()
            end
        end
    end )
end

if SERVER then
    function ENT:Initialize()
    
        self:SetModel( "models/props_wasteland/laundry_washer001a.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
    
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then phys:Wake() end
        self:SetUseType(SIMPLE_USE)

    end
    
    function ENT:Use( act, ply )
        net.Start( "ST_OpenDowngradeMenu" )
            net.WriteEntity( self )
        net.Send( ply )
    end

    net.Receive( "ST_DowngradeWeapon", function( len, ply )
        --ambient/energy/weld1.wav
        local this = net.ReadEntity()

        if CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent == nil then
            DarkRP.notify( ply, 1, 4, "Downgrade failed, you cannot downgrade that weapon." )
        return end
        if !ply:canAfford( CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].price * 0.2 ) then
            DarkRP.notify( ply, 1, 4, "Downgrade failed, you don't have enough money." )
        return end
        this:EmitSound( "ambient/energy/weld1.wav" )
        DarkRP.notify( ply, 0, 4, "Downgrade succeeded! Your " .. ply:GetActiveWeapon():GetPrintName() .. " was downgraded to " .. weapons.Get( CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent ).PrintName .. " and placed in your inventory." )
        ply:Give( CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent )
        local finalParent = CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent
        for _ = CSO_WEAPONS_TREE[ CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent ].deep, 2, -1 do
            finalParent = CSO_WEAPONS_TREE[ finalParent ].parent
        end
        if ply:GetNWString( "WepLoadoutSlot" .. ply:GetActiveWeapon().Slot + 1, "nil" ) == ply:GetActiveWeapon():GetClass() then
            if ply:GetActiveWeapon().Slot == weapons.Get( CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent ).Slot then
                ply:SetNWString( "WepLoadoutSlot" .. ply:GetActiveWeapon().Slot + 1, CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent )
            else
                ply:SetNWString( "WepLoadoutSlot" .. ply:GetActiveWeapon().Slot + 1, "nil" )
                timer.Simple( 4, function()
                    DarkRP.notify( ply, 0, 8, "Your new weapon has a different slot than your previous weapon. Your new weapon has not been added to your loadout." )
                end )
            end
        end
        ply.wepInvTable[ finalParent ] = CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].parent
        file.Write( "ankorp/" .. ply:SteamID64() .. ".txt", util.TableToJSON( ply.wepInvTable ) )
        ply:addMoney( -CSO_WEAPONS_TREE[ply:GetActiveWeapon():GetClass()].price * 0.2 )
        ply:StripWeapon( ply:GetActiveWeapon():GetClass() )

    end )

end
