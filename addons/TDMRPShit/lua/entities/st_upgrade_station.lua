-- i don't want to comment these right now
-- i have a headache

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Upgrade Station"
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

    net.Receive( "ST_OpenUpgradeMenu", function()
    
        local this = net.ReadEntity()

        local UpgradeWindow = vgui.Create( "DFrame" )
        UpgradeWindow:SetPos( 5, 5 )
        UpgradeWindow:SetSize( 800, 600 )
        UpgradeWindow:SetTitle( "" )
        UpgradeWindow:SetVisible( true )
        UpgradeWindow:SetDraggable( false )
        UpgradeWindow:ShowCloseButton( false )
        UpgradeWindow:MakePopup()
        UpgradeWindow:Center()
        UpgradeWindow.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 21, 22, 49, 255 ) )
            draw.SimpleText( "UPGRADE STATION", "UPGMed", 5, 2 )
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
        local wepUpgrades = {}
        for k,v in pairs( CSO_WEAPONS_TREE ) do
            if v.parent == LocalPlayer():GetActiveWeapon():GetClass() then
                table.insert( wepUpgrades, k )
            end
        end
        
        if wepUpgrades == {} or wepUpgrades == nil or wepUpgrades[1] == nil then
            WeaponLabel:SetText( "Your " .. ( LocalPlayer():GetActiveWeapon():GetPrintName()[1] == "#" and language.GetPhrase( LocalPlayer():GetActiveWeapon():GetPrintName() ) or LocalPlayer():GetActiveWeapon():GetPrintName() ) .. " cannot be upgraded." )
            WeaponLabel:SizeToContents()
            WeaponLabel:CenterHorizontal()
        else
            WeaponLabel:SetText( "Select an upgrade for your " .. LocalPlayer():GetActiveWeapon():GetPrintName() .. ":" )
            WeaponLabel:SizeToContents()
            WeaponLabel:CenterHorizontal()
            for k,v in pairs( wepUpgrades ) do
                local UpgradedWeapon = vgui.Create( "DButton", UpgradeWindow )
                UpgradedWeapon:SetPos( 100, 100 + k*35 )
                UpgradedWeapon:SetSize( 600, 30 )
                UpgradedWeapon:SetText( weapons.Get( v ).PrintName .. " - " .. DarkRP.formatMoney( CSO_WEAPONS_TREE[v].price ) )
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
                    net.Start( "ST_UpgradeWeapon" )
                        net.WriteString( self.class )
                        net.WriteEntity( this )
                    net.SendToServer()
                    UpgradeWindow:Close()
                end
            end
        end

    end )

end

if SERVER then
    function ENT:Initialize()
    
        self:SetModel( "models/props_wasteland/laundry_washer003.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
    
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then phys:Wake() end
        self:SetUseType(SIMPLE_USE)

    end
    
    function ENT:Use( act, ply )
        net.Start( "ST_OpenUpgradeMenu" )
            net.WriteEntity( self )
        net.Send( ply )
    end

    net.Receive( "ST_UpgradeWeapon", function( _, ply )
        local wep = net.ReadString()
        local this = net.ReadEntity()

        if CSO_WEAPONS_TREE[wep].parent != ply:GetActiveWeapon():GetClass() then
            DarkRP.notify( ply, 1, 4, "Upgrade failed, you are not holding the right weapon." )
        return end
        if !ply:canAfford( CSO_WEAPONS_TREE[wep].price ) then
            DarkRP.notify( ply, 1, 4, "Upgrade failed, you don't have enough money." )
        return end
        this:EmitSound( "ambient/energy/whiteflash.wav" )
        DarkRP.notify( ply, 0, 4, "Upgrade succeeded! Your " .. ply:GetActiveWeapon():GetPrintName() .. " was upgraded to " .. weapons.Get( wep ).PrintName .. " and placed in your inventory." )
        if ply:GetNWString( "WepLoadoutSlot" .. ply:GetActiveWeapon().Slot + 1, "nil" ) == ply:GetActiveWeapon():GetClass() then
            if ply:GetActiveWeapon().Slot == weapons.Get( wep ).Slot then
                ply:SetNWString( "WepLoadoutSlot" .. ply:GetActiveWeapon().Slot + 1, wep )
            else
                ply:SetNWString( "WepLoadoutSlot" .. ply:GetActiveWeapon().Slot + 1, "nil" )
                timer.Simple( 4, function()
                    DarkRP.notify( ply, 0, 8, "Your new weapon has a different slot than your previous weapon. Your new weapon has not been added to your loadout." )
                end )
            end
        end
        ply:StripWeapon( ply:GetActiveWeapon():GetClass() )
        ply:Give( wep )
        ply:SelectWeapon( wep )
        local finalParent = wep
        for _ = CSO_WEAPONS_TREE[ wep ].deep, 2, -1 do
            finalParent = CSO_WEAPONS_TREE[ finalParent ].parent
        end
        ply.wepInvTable[ finalParent ] = wep
        file.Write( "ankorp/" .. ply:SteamID64() .. ".txt", util.TableToJSON( ply.wepInvTable ) )
        ply:addMoney( -CSO_WEAPONS_TREE[wep].price )

    end )

end