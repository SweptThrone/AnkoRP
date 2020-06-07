-- i don't want to comment these right now
-- i have a headache

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Loadout Cabinet"
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

    net.Receive( "ST_OpenLoadoutMenu", function( len, ply )
    
        local data = net.ReadData( len )
        local inv = util.JSONToTable( util.Decompress( data ) )

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
            draw.SimpleText( "YOUR LOADOUT", "UPGMed", 5, 2 )
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

        local Slot1Label = vgui.Create( "DLabel", UpgradeWindow )
        Slot1Label:SetText( "SLOT 1:" )
        Slot1Label:SetFont( "UPGMini" )
        Slot1Label:SetTextColor( color_white )
        Slot1Label:SetSize( 100, 20 )
        Slot1Label:SetPos( 110, 75 )

        local Slot1Box = vgui.Create( "DComboBox", UpgradeWindow )
        Slot1Box:SetPos( 180, 75 )
        Slot1Box:SetSize( 300, 20 )
        Slot1Box:AddChoice( "[Job default]", "nil" )
        Slot1Box:SetValue( LocalPlayer():GetNWString( "WepLoadoutSlot1", "nil" ) == "nil" and "[Job default]" or weapons.Get( LocalPlayer():GetNWString( "WepLoadoutSlot1" ) ).PrintName )
        for k,v in pairs( inv ) do
            if v != "nil" then
            if weapons.Get( v ).Slot + 1 == 1 then
                Slot1Box:AddChoice( weapons.Get( v ).PrintName, v )
            end
            end
        end
        function Slot1Box:OnSelect( index, value, dat )
            net.Start( "ST_SetLoadout" )
                net.WriteInt( 1, 4 )
                net.WriteString( dat )
            net.SendToServer()
        end

        local Slot2Label = vgui.Create( "DLabel", UpgradeWindow )
        Slot2Label:SetText( "SLOT 2:" )
        Slot2Label:SetFont( "UPGMini" )
        Slot2Label:SetTextColor( color_white )
        Slot2Label:SetSize( 100, 20 )
        Slot2Label:SetPos( 110, 125 )

        local Slot2Box = vgui.Create( "DComboBox", UpgradeWindow )
        Slot2Box:SetPos( 180, 125 )
        Slot2Box:SetSize( 300, 20 )
        Slot2Box:AddChoice( "[Job default]", "nil" )
        Slot2Box:SetValue( LocalPlayer():GetNWString( "WepLoadoutSlot2", "nil" ) == "nil" and "[Job default]" or weapons.Get( LocalPlayer():GetNWString( "WepLoadoutSlot2" ) ).PrintName )
        for k,v in pairs( inv ) do
            if v != "nil" then
            if weapons.Get( v ).Slot + 1 == 2 then
                Slot2Box:AddChoice( weapons.Get( v ).PrintName, v )
            end
            end
        end
        function Slot2Box:OnSelect( index, value, dat )
            net.Start( "ST_SetLoadout" )
                net.WriteInt( 2, 4 )
                net.WriteString( dat )
            net.SendToServer()
        end

        local Slot3Label = vgui.Create( "DLabel", UpgradeWindow )
        Slot3Label:SetText( "SLOT 3:" )
        Slot3Label:SetFont( "UPGMini" )
        Slot3Label:SetTextColor( color_white )
        Slot3Label:SetSize( 100, 20 )
        Slot3Label:SetPos( 110, 175 )

        local Slot3Box = vgui.Create( "DComboBox", UpgradeWindow )
        Slot3Box:SetPos( 180, 175 )
        Slot3Box:SetSize( 300, 20 )
        Slot3Box:AddChoice( "[Job default]", "nil" )
        Slot3Box:SetValue( LocalPlayer():GetNWString( "WepLoadoutSlot3", "nil" ) == "nil" and "[Job default]" or weapons.Get( LocalPlayer():GetNWString( "WepLoadoutSlot3" ) ).PrintName )
        for k,v in pairs( inv ) do
            if v != "nil" then
            if weapons.Get( v ).Slot + 1 == 3 then
                Slot3Box:AddChoice( weapons.Get( v ).PrintName, v )
            end
            end
        end
        function Slot3Box:OnSelect( index, value, dat )
            net.Start( "ST_SetLoadout" )
                net.WriteInt( 3, 4 )
                net.WriteString( dat )
            net.SendToServer()
        end

        local Slot4Label = vgui.Create( "DLabel", UpgradeWindow )
        Slot4Label:SetText( "SLOT 4:" )
        Slot4Label:SetFont( "UPGMini" )
        Slot4Label:SetTextColor( color_white )
        Slot4Label:SetSize( 100, 20 )
        Slot4Label:SetPos( 110, 225 )

        local Slot4Box = vgui.Create( "DComboBox", UpgradeWindow )
        Slot4Box:SetPos( 180, 225 )
        Slot4Box:SetSize( 300, 20 )
        Slot4Box:AddChoice( "[Job default]", "nil" )
        Slot4Box:SetValue( LocalPlayer():GetNWString( "WepLoadoutSlot4", "nil" ) == "nil" and "[Job default]" or weapons.Get( LocalPlayer():GetNWString( "WepLoadoutSlot4" ) ).PrintName )
        for k,v in pairs( inv ) do
            if v != "nil" then
            if weapons.Get( v ).Slot + 1 == 4 then
                Slot4Box:AddChoice( weapons.Get( v ).PrintName, v )
            end
            end
        end
        function Slot4Box:OnSelect( index, value, dat )
            net.Start( "ST_SetLoadout" )
                net.WriteInt( 4, 4 )
                net.WriteString( dat )
            net.SendToServer()
        end

        local Slot5Label = vgui.Create( "DLabel", UpgradeWindow )
        Slot5Label:SetText( "SLOT 5:" )
        Slot5Label:SetFont( "UPGMini" )
        Slot5Label:SetTextColor( color_white )
        Slot5Label:SetSize( 100, 20 )
        Slot5Label:SetPos( 110, 275 )

        local Slot5Box = vgui.Create( "DComboBox", UpgradeWindow )
        Slot5Box:SetPos( 180, 275 )
        Slot5Box:SetSize( 300, 20 )
        Slot5Box:AddChoice( "[Job default]", "nil" )
        Slot5Box:SetValue( LocalPlayer():GetNWString( "WepLoadoutSlot5", "nil" ) == "nil" and "[Job default]" or weapons.Get( LocalPlayer():GetNWString( "WepLoadoutSlot5" ) ).PrintName )
        for k,v in pairs( inv ) do
            if v != "nil" then
            if weapons.Get( v ).Slot + 1 == 5 then
                Slot5Box:AddChoice( weapons.Get( v ).PrintName, v )
            end
            end
        end
        function Slot5Box:OnSelect( index, value, dat )
            net.Start( "ST_SetLoadout" )
                net.WriteInt( 5, 4 )
                net.WriteString( dat )
            net.SendToServer()
        end

    end )

end

if SERVER then
    function ENT:Initialize()
    
        self:SetModel( "models/props_wasteland/controlroom_storagecloset001a.mdl" )
        --models/props/cs_assault/MoneyPallet02.mdl - some full
        --models/props/cs_assault/MoneyPallet.mdl - fully full
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
    
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then phys:Wake() end
        self:SetUseType(SIMPLE_USE)

    end
    
    function ENT:Use( act, ply )
        net.Start( "ST_OpenLoadoutMenu" )
            net.WriteData( util.Compress( util.TableToJSON( ply.wepInvTable ) ), #util.Compress( util.TableToJSON( ply.wepInvTable ) ) )
        net.Send( ply )
    end

    net.Receive( "ST_SetLoadout", function( len, ply )
    
        local slot = net.ReadInt( 4 )
        local wep = net.ReadString()

        print( slot, wep )

        ply:SetNWString( "WepLoadoutSlot" .. slot, wep )

    end )

end