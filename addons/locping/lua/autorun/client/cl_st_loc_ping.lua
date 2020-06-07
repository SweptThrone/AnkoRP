--[[
    This is an edited version of my Location Pinging addon
    specifically for AnkoRP, where pings are all team-specific.

    Pretty sure I just commented out everything I didn't need for this.
]]--

surface.CreateFont( "PingFont", {
	font = "Arial",
	extended = false,
	size = 72,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

local REQUEST_SEND = 0
local REQUEST_CANCEL = 1
local REQUEST_ACCEPT = 2
local REQUEST_STOP = 3

hook.Add( "InitPostEntity", "SetupEmptyPingConfigTables", function()

    --[[LocalPlayer().Whitelist = {}
    LocalPlayer().Sentlist = {}
    LocalPlayer().Inclist = {}
    LocalPlayer().KnowsHowToOpenMenu = false]]

end )

concommand.Add( "st_ping_loc", function( ply )

	if ply:getJobTable().category == "Citizens" then return end
    local pingLoc = ply:GetEyeTrace().HitPos
    net.Start( "swepts_ping_sys_tosv" )
        net.WriteVector( pingLoc )
        --net.WriteTable( ply.Whitelist )
    net.SendToServer()

end )

net.Receive( "swepts_ping_sys_tocl", function()

    local pingLoc = net.ReadVector()
    local ply = net.ReadEntity()
    local pingLocScr
    local plyPos = ply:GetPos() + ( ply:Crouching() and Vector( 0, 0, 28 ) or Vector( 0, 0, 64 ) )
    local offScreen = { 
        above = false,
        below = false,
        right = false,
        left = false
    }
    local osText = ""

    hook.Remove( "HUDPaint", "SweptIncomingPing" .. ply:SteamID64() )

    hook.Add( "HUDPaint", "SweptIncomingPing" .. ply:SteamID64(), function()

        pingLocScr = pingLoc

        cam.Start3D()
            pingLocScr = pingLocScr:ToScreen()
        cam.End3D()

        offScreen = { 
            above = pingLocScr.y < 0,
            below = pingLocScr.y > ScrH(),
            right = pingLocScr.x > ScrW(),
            left = pingLocScr.x < 0
        }

        pingLocScr.x = math.Clamp( pingLocScr.x, 0, ScrW() )
        pingLocScr.y = math.Clamp( pingLocScr.y, 0, ScrH() )

        if !offScreen.above and !offScreen.below and !offScreen.right and !offScreen.left then
            surface.SetTextColor( ply:GetPlayerColor():ToColor() )
            surface.SetTextPos( pingLocScr.x - 13, pingLocScr.y - 39 )
            surface.SetFont( "PingFont" )
            surface.DrawText( "•" )
            surface.SetTextPos( pingLocScr.x - 3, pingLocScr.y - 11 )
            surface.SetTextColor( Color( 255, 255, 255 ) )
            surface.SetFont( "Trebuchet24" )
            surface.DrawText( "!    " .. math.Round( LocalPlayer():GetPos():Distance( pingLoc ) / 52.49, 3 )  .. "m" )
        else
            surface.SetTextColor( ply:GetPlayerColor():ToColor() )
            surface.SetTextPos( pingLocScr.x - ( offScreen.right and 32 or 0 ), pingLocScr.y - ( offScreen.below and 52 or 24 ) )
            surface.SetFont( "PingFont" )
            surface.DrawText( "•" )
        end

    end )

    hook.Add( "PreDrawEffects", "DrawQuickPingLine" .. ply:SteamID64(), function()
        render.DrawLine( plyPos, pingLoc, ply:GetPlayerColor():ToColor(), true )
    end )

    timer.Create( "SweptLine" .. ply:SteamID64(), 0.25, 1, function()
        hook.Remove( "PreDrawEffects", "DrawQuickPingLine" .. ply:SteamID64() )
    end )

    surface.PlaySound( "garrysmod/ui_click.wav" )
    notification.AddLegacy( ply:Name() .. " pinged a location.", NOTIFY_GENERIC, 3 )

    timer.Create( "SweptPing" .. ply:SteamID64(), 10, 1, function()
        hook.Remove( "HUDPaint", "SweptIncomingPing" .. ply:SteamID64() )
    end )
end )

--[[
concommand.Add( "st_ping_config", function( ply )

    LocalPlayer().KnowsHowToOpenMenu = true

    local LocationPingConfig = vgui.Create( "DFrame" )
    LocationPingConfig:SetPos( ScrW() * 0.3525, ScrH() * 0.35 )
    LocationPingConfig:SetSize( 640, 480 )
    LocationPingConfig:Center()
    LocationPingConfig:SetTitle( "Location Pinging Config" )
    LocationPingConfig:SetVisible( true )
    LocationPingConfig:SetDraggable( false )
    LocationPingConfig:ShowCloseButton( true )
    LocationPingConfig:MakePopup()
	LocationPingConfig.Paint = function( self, w, h ) 
		draw.RoundedBox( 0, 0, 0, w, h, LocalPlayer():GetPlayerColor():ToColor() )
	end

    local AllPlayersBox = vgui.Create( "DListView", LocationPingConfig )
    local SentPlayersBox = vgui.Create( "DListView", LocationPingConfig )
    local PendingPlayersBox = vgui.Create( "DListView", LocationPingConfig )
    local WhiteListPlayerBox = vgui.Create( "DListView", LocationPingConfig )

    -- all players --

    local AllTooltip = vgui.Create( "DLabel", LocationPingConfig )
    AllTooltip:SetText( "Click a player to request to share pings." )
    AllTooltip:SetTextColor( color_white )
    AllTooltip:SizeToContents()
    AllTooltip:SetPos( 12, 30 )

    AllPlayersBox:SetPos( 5, 50 )
    AllPlayersBox:SetSize( 205, 425 )
    AllPlayersBox:AddColumn( "Unshared Players" )
    for k,v in pairs( player.GetAll() ) do
        if v != LocalPlayer() and !LocalPlayer().Whitelist[v] and !LocalPlayer().Sentlist[v] and !LocalPlayer().Inclist[v] then
            local newLine = AllPlayersBox:AddLine( v:Name() )
            newLine.plyEnt = v
        end
    end
    function AllPlayersBox:OnRowSelected( i, ln )
        net.Start( "swepts_ping_update_status_tosv" )
            net.WriteInt( REQUEST_SEND, 3 )
            net.WriteEntity( ln.plyEnt )
        net.SendToServer()
        LocalPlayer().Sentlist[ ln.plyEnt ] = true
        local newLine = SentPlayersBox:AddLine( ln:GetText() )
        newLine.plyEnt = ln.plyEnt
        self:RemoveLine( i )
        notification.AddLegacy( "You sent a ping sharing request to " .. ln.plyEnt:Name(), NOTIFY_GENERIC, 5 )
        surface.PlaySound( "garrysmod/ui_hover.wav" )
        LocationPingConfig:Close()
    end

    -- sent requests --

    local SentTooltip = vgui.Create( "DLabel", LocationPingConfig )
    SentTooltip:SetText( "Click a sent request to cancel it." )
    SentTooltip:SetTextColor( color_white )
    SentTooltip:SizeToContents()
    SentTooltip:SetPos( 240, 30 )

    SentPlayersBox:SetPos( 215, 50 )
    SentPlayersBox:SetSize( 208, 200 )
    SentPlayersBox:AddColumn( "Requests Sent" )
    if LocalPlayer().Sentlist != {} and LocalPlayer().Sentlist != nil then
        for k,v in pairs( LocalPlayer().Sentlist ) do
            if v then
                local newLine = SentPlayersBox:AddLine( k:Name() )
                newLine.plyEnt = k
            end
        end
    end
    function SentPlayersBox:OnRowSelected( i, ln )
        net.Start( "swepts_ping_update_status_tosv" )
            net.WriteInt( REQUEST_CANCEL, 3 )
            net.WriteEntity( ln.plyEnt )
        net.SendToServer()
        LocalPlayer().Sentlist[ ln.plyEnt ] = false
        local newLine = AllPlayersBox:AddLine( ln:GetText() )
        newLine.plyEnt = ln.plyEnt
        self:RemoveLine( i )
        notification.AddLegacy( "You cancelled your ping share request with " .. ln.plyEnt:Name(), NOTIFY_ERROR, 5 )
        surface.PlaySound( "garrysmod/ui_hover.wav" )
        LocationPingConfig:Close()
    end

    -- incoming requests --

    local IncomingTooltip = vgui.Create( "DLabel", LocationPingConfig )
    IncomingTooltip:SetText( "Click a request to accept it." )
    IncomingTooltip:SetTextColor( color_white )
    IncomingTooltip:SizeToContents()
    IncomingTooltip:SetPos( 250, 255 )

    PendingPlayersBox:SetPos( 215, 275 )
    PendingPlayersBox:SetSize( 208, 200 )
    PendingPlayersBox:AddColumn( "Incoming Requests" )
    if LocalPlayer().Inclist != {} and LocalPlayer().Inclist != nil then
        for k,v in pairs( LocalPlayer().Inclist ) do
            if v then
                local newLine = PendingPlayersBox:AddLine( k:Name() )
                newLine.plyEnt = k
            end
        end
    end
    function PendingPlayersBox:OnRowSelected( i, ln )
        net.Start( "swepts_ping_update_status_tosv" )
            net.WriteInt( REQUEST_ACCEPT, 3 )
            net.WriteEntity( ln.plyEnt )
        net.SendToServer()
        LocalPlayer().Inclist[ ln.plyEnt ] = false
        LocalPlayer().Whitelist[ ln.plyEnt ] = true
        local newLine = WhiteListPlayerBox:AddLine( ln:GetText() )
        newLine.plyEnt = ln.plyEnt
        self:RemoveLine( i )
        notification.AddLegacy( "You started sharing pings with " .. ln.plyEnt:Name(), NOTIFY_GENERIC, 5 )
        surface.PlaySound( "garrysmod/ui_hover.wav" )
        LocationPingConfig:Close()
    end

    -- approved players --

    local WhiteTooltip = vgui.Create( "DLabel", LocationPingConfig )
    WhiteTooltip:SetText( "Click a player to stop sharing pings." )
    WhiteTooltip:SetTextColor( color_white )
    WhiteTooltip:SizeToContents()
    WhiteTooltip:SetPos( 447, 30 )

    WhiteListPlayerBox:SetPos( 430, 50 )
    WhiteListPlayerBox:SetSize( 205, 425 )
    WhiteListPlayerBox:AddColumn( "Shared Players" )
    if LocalPlayer().Whitelist != {} and LocalPlayer().Whitelist != nil then
        for k,v in pairs( LocalPlayer().Whitelist ) do
            if v then
                local newLine = WhiteListPlayerBox:AddLine( k:Name() )
                newLine.plyEnt = k
            end
        end
    end
    function WhiteListPlayerBox:OnRowSelected( i, ln )
        net.Start( "swepts_ping_update_status_tosv" )
            net.WriteInt( REQUEST_STOP, 3 )
            net.WriteEntity( ln.plyEnt )
        net.SendToServer()
        LocalPlayer().Inclist[ ln.plyEnt ] = true
        LocalPlayer().Whitelist[ ln.plyEnt ] = false
        local newLine = PendingPlayersBox:AddLine( ln:GetText() )
        newLine.plyEnt = ln.plyEnt
        self:RemoveLine( i )
        notification.AddLegacy( "You stopped sharing your pings with " .. ln.plyEnt:Name(), NOTIFY_ERROR, 5 )
        surface.PlaySound( "garrysmod/ui_hover.wav" )
        LocationPingConfig:Close()
    end

end )


net.Receive( "swepts_ping_update_status_tocl", function()

    local typ = net.ReadInt( 3 )
    local sendingPly = net.ReadEntity()
    local receivnPly = net.ReadEntity()

    if LocalPlayer() == sendingPly then
        
        if typ == REQUEST_SEND then
            LocalPlayer().Sentlist[ receivnPly ] = true
        elseif typ == REQUEST_CANCEL then
            LocalPlayer().Sentlist[ receivnPly ] = false
        elseif typ == REQUEST_ACCEPT then
            LocalPlayer().Inclist[ receivnPly ] = false
            LocalPlayer().Whitelist[ receivnPly ] = true
        elseif typ == REQUEST_STOP then
            LocalPlayer().Inclist[ receivnPly ] = true
            LocalPlayer().Whitelist[ receivnPly ] = false
        end

    elseif LocalPlayer() == receivnPly then
        
         if typ == REQUEST_SEND then
            LocalPlayer().Inclist[ sendingPly ] = true
            notification.AddLegacy( sendingPly:Name() .. " is requesting to share pings.", NOTIFY_HINT, 5 )
            if !LocalPlayer().KnowsHowToOpenMenu then
                notification.AddLegacy( "Type st_ping_config in console to open the menu.", NOTIFY_HINT, 5 )
                print( "Type st_ping_config in console to open the menu." )
                LocalPlayer().KnowsHowToOpenMenu = true
            end
            surface.PlaySound( "garrysmod/ui_hover.wav" )
        elseif typ == REQUEST_CANCEL then
            LocalPlayer().Inclist[ sendingPly ] = false
            notification.AddLegacy( sendingPly:Name() .. " cancelled their ping share request.", NOTIFY_ERROR, 5 )
            surface.PlaySound( "garrysmod/ui_hover.wav" )
        elseif typ == REQUEST_ACCEPT then
            LocalPlayer().Sentlist[ sendingPly ] = false
            LocalPlayer().Whitelist[ sendingPly ] = true
            notification.AddLegacy( sendingPly:Name() .. " accepted your ping share request.", NOTIFY_GENERIC, 5 )
            surface.PlaySound( "garrysmod/ui_hover.wav" )
        elseif typ == REQUEST_STOP then
            LocalPlayer().Sentlist[ sendingPly ] = true
            LocalPlayer().Whitelist[ sendingPly ] = false
            notification.AddLegacy( sendingPly:Name() .. " stopped sharing their pings.", NOTIFY_ERROR, 5 )
            surface.PlaySound( "garrysmod/ui_hover.wav" )
        end

    end

end )
]]