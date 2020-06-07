-- i don't want to comment these right now
-- i have a headache

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Inventory Locker"
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

    net.Receive( "ST_OpenInventoryMenu", function( len, ply )
    
        local inv = net.ReadData( len )
        local invTab = util.JSONToTable( util.Decompress( inv ) )

        local DEEP_COLORS = {
            Color( 255, 255, 255 ),
            Color( 146, 95, 72 ), --copper
            Color( 199, 155, 92 ), --bronze
            Color( 192, 192, 192 ), --silver
            Color( 219, 170, 16 ), --gold
            Color( 177, 1, 215 ), --mystic
			Color( 255, 215, 0 ) --transcendent
        }

        local UpgradeWindow = vgui.Create( "DFrame" )
        UpgradeWindow:SetPos( 5, 5 )
        UpgradeWindow:SetSize( 600, 400 )
        UpgradeWindow:SetTitle( "" )
        UpgradeWindow:SetVisible( true )
        UpgradeWindow:SetDraggable( false )
        UpgradeWindow:ShowCloseButton( false )
        UpgradeWindow:MakePopup()
        UpgradeWindow:Center()
        UpgradeWindow.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 21, 22, 49, 255 ) )
            draw.SimpleText( "YOUR INVENTORY", "UPGMed", 5, 2 )
        end

        local CloseButton = vgui.Create( "DButton", UpgradeWindow )
        CloseButton:SetPos( 560, 0 )
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

        local InventoryScroller = vgui.Create( "DScrollPanel", UpgradeWindow )
        InventoryScroller:SetPos( 5, 60 )
        InventoryScroller:SetSize( 580, 300 )

        local ItemStore = vgui.Create( "DButton", UpgradeWindow )
        ItemStore:SetText( "STORE CURRENT WEAPON" )
        ItemStore:SetFont( "UPGMini" )
        ItemStore:SetTextColor( color_white )
        ItemStore:SetSize( 250, 30 )
        ItemStore:SetPos( 175, 360 )
        function ItemStore:Paint( w, h )
            if self:IsHovered() then
                surface.SetDrawColor( Color( 0, 128, 0 ) )
            else
                surface.SetDrawColor( Color( 0, 255, 0 ) )
            end
            surface.DrawOutlinedRect( 0, 0, w, h)
        end
        function ItemStore:DoClick()
            net.Start( "ST_InventoryTransaction" )
                net.WriteString( "store" )
            net.SendToServer()
            UpgradeWindow:Close()
        end

        local i = 0
        for k,v in pairs( invTab ) do
            if v != "nil" then
                local ItemLabel = InventoryScroller:Add( "DLabel" )
                ItemLabel:SetText( weapons.Get( v ).PrintName )
                ItemLabel:SetFont( "UPGMini" )
                ItemLabel:SetTextColor( DEEP_COLORS[ CSO_WEAPONS_TREE[ v ].deep ] )
                ItemLabel:SetSize( 400, 20 )
                ItemLabel:SetPos( 0, ( i * 20 ) )

                local ItemEquip = InventoryScroller:Add( "DButton" )
                ItemEquip:SetText( "EQUIP" )
				ItemEquip:SetTooltip( "Equip your " .. weapons.Get( v ).PrintName )
                ItemEquip:SetFont( "UPGMini" )
                ItemEquip:SetTextColor( color_white )
                ItemEquip:SetSize( 75, 20 )
                ItemEquip:SetPos( 405, ( i * 20 ) )
                ItemEquip.class = v
                function ItemEquip:Paint( w, h )
                    if self:IsHovered() then
                        surface.SetDrawColor( Color( 128, 128, 128 ) )
                    else
                        surface.SetDrawColor( Color( 255, 255, 255 ) )
                    end
                    surface.DrawOutlinedRect( 0, 0, w, h)
                end
                function ItemEquip:DoClick()
                    net.Start( "ST_InventoryTransaction" )
                        net.WriteString( "equip" )
                        net.WriteString( self.class )
                    net.SendToServer()
                    UpgradeWindow:Close()
                end

                local ItemScrap = InventoryScroller:Add( "DButton" )
                ItemScrap:SetText( "SCRAP" )
				ItemScrap:SetTooltip( "Scrap your " .. weapons.Get( v ).PrintName )
                ItemScrap:SetFont( "UPGMini" )
                ItemScrap:SetTextColor( color_white )
                ItemScrap:SetSize( 75, 20 )
                ItemScrap:SetPos( 500, ( i * 20 ) )
                ItemScrap.class = v
                function ItemScrap:Paint( w, h )
                    if self:IsHovered() then
                        surface.SetDrawColor( Color( 128, 0, 0 ) )
                    else
                        surface.SetDrawColor( Color( 255, 0, 0 ) )
                    end
                    surface.DrawOutlinedRect( 0, 0, w, h)
                end
                function ItemScrap:DoClick()
                    net.Start( "ST_InventoryTransaction" )
                        net.WriteString( "scrap" )
                        net.WriteString( self.class )
                    net.SendToServer()
                    UpgradeWindow:Close()
                end
                i = i + 1
            end
        end

    end )

end

if SERVER then
    function ENT:Initialize()
    
        self:SetModel( "models/props_c17/Lockers001a.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
    
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then phys:Wake() end
        self:SetUseType(SIMPLE_USE)

    end
    
    function ENT:Use( act, ply )
        self:EmitSound( "items/ammocrate_open.wav" )
        net.Start( "ST_OpenInventoryMenu" )
            net.WriteData( util.Compress( util.TableToJSON( ply.wepInvTable ) ), #util.Compress( util.TableToJSON( ply.wepInvTable ) ) )
        net.Send( ply )
    end

    net.Receive( "ST_InventoryTransaction", function( _, ply )
    
        local typ = net.ReadString()

        local function GetFinalParent( wep )
            if CSO_WEAPONS_TREE[ wep ].parent == "nil" then
                return wep
            end

            local finalParent = wep
            for _ = CSO_WEAPONS_TREE[ wep ].deep, 2, -1 do
                finalParent = CSO_WEAPONS_TREE[ finalParent ].parent
            end

            return finalParent
        end

        if typ == "store" then
            if CSO_WEAPONS_TREE[ ply:GetActiveWeapon():GetClass() ] == nil then
                DarkRP.notify( ply, 1, 4, "You cannot store that weapon." )
            return end
            if ply.wepInvTable[ GetFinalParent( ply:GetActiveWeapon():GetClass() ) ] == ply:GetActiveWeapon():GetClass() then
                DarkRP.notify( ply, 1, 4, "That weapon is already in your inventory." )
            return end
            if ply.wepInvTable[ GetFinalParent( ply:GetActiveWeapon():GetClass() ) ] != "nil" then
                DarkRP.notify( ply, 1, 8, "Could not store your " .. weapons.Get( ply:GetActiveWeapon():GetClass() ).PrintName .. " as you already have a " .. weapons.Get( ply.wepInvTable[ GetFinalParent( ply:GetActiveWeapon():GetClass() ) ] ).PrintName .. ". Scrap it to store your new weapon." )
            else
                ply.wepInvTable[ GetFinalParent( ply:GetActiveWeapon():GetClass() ) ] = ply:GetActiveWeapon():GetClass()
                file.Write( "ankorp/" .. ply:SteamID64() .. ".txt", util.TableToJSON( ply.wepInvTable ) )
                DarkRP.notify( ply, 0, 4, "Your " .. weapons.Get( ply:GetActiveWeapon():GetClass() ).PrintName .. " has been added to your inventory." )
            end
        elseif typ == "equip" then
            local wep = net.ReadString()
			
			if ply:getJobTable().category == "Monsters" and weapons.Get( wep ).Slot + 1 != 1 then
				DarkRP.notify( ply, 1, 4, "You cannot use guns as a Monster!" )
				return
			end
			
			if ply:Team() == TEAM_ELITE then
				DarkRP.notify( ply, 1, 4, "You cannot use custom weapons as a Combine Elite!" )
				return
			end
			
			ply:SetAmmo( 0, weapons.Get( wep ):GetPrimaryAmmoType() )
			
            for k,v in pairs( ply:GetWeapons() ) do
                if v.Slot == weapons.Get( wep ).Slot and string.sub( v:GetClass(), 1, 3 ) == "tfa" and GetFinalParent( v:GetClass() ) == GetFinalParent( wep ) then
                    DarkRP.notify( ply, 0, 4, "Your " .. v.PrintName .. " was replaced with your " .. weapons.Get( wep ).PrintName .. "." )
                    ply:StripWeapon( v:GetClass() )
                end
                ply:Give( wep )
            end
        elseif typ == "scrap" then
            local wep = net.ReadString()
            if ply:HasWeapon( wep ) then
                ply:StripWeapon( wep )
            end
            if ply:GetNWString( "WepLoadoutSlot" .. weapons.Get( wep ).Slot + 1 ) == wep then
                ply:SetNWString( "WepLoadoutSlot" .. weapons.Get( wep ).Slot + 1, "nil" )
            end
            ply.wepInvTable[ GetFinalParent( wep ) ] = "nil"
            file.Write( "ankorp/" .. ply:SteamID64() .. ".txt", util.TableToJSON( ply.wepInvTable ) )
			if CSO_JOB_DEFAULTS[ wep ] then
				DarkRP.notify( ply, 0, 4, "You scrapped your " .. weapons.Get( wep ).PrintName .. " and earned $0 because it is a job default." )
			else
				DarkRP.notify( ply, 0, 4, "You scrapped your " .. weapons.Get( wep ).PrintName .. " and earned " .. DarkRP.formatMoney( CSO_WEAPONS_TREE[ wep ].price * 0.25 ) .. "." )
				ply:addMoney( CSO_WEAPONS_TREE[ wep ].price * 0.25 )
			end
        end

    end )

end