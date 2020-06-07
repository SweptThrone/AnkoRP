--[[
	All of this simply draws a V over your teammates' heads.
	This was requested by a friend who committed friendly fire
	just a little too much.
]]--

hook.Add( "PostDrawOpaqueRenderables", "GetChevronOverPlayers", function()

    LocalPlayer().teammateChevrons = {}
    for k,v in pairs( player.GetAll() ) do
        if v:getJobTable() != nil and v:getJobTable() != {} and v:getJobTable().category == LocalPlayer():getJobTable().category and v:getJobTable().category != "Citizens" and LocalPlayer():getJobTable().category != "Citizens" then
            LocalPlayer().teammateChevrons[ v:EntIndex() ] = ( v:GetPos() + Vector( 0, 0, 72 ) ):ToScreen()
        end
    end

end )

surface.CreateFont( "STChevronText", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 36,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = true,
} )

hook.Add( "HUDPaint", "DrawChevronsOverTeammates", function()

    for k,v in pairs( LocalPlayer().teammateChevrons ) do
		if Entity( k ):Alive() then
			surface.SetFont( "STChevronText" )
			surface.SetTextColor( Entity( k ):GetPlayerColor():ToColor() )
			surface.SetTextPos( v.x - 8, v.y )
			surface.DrawText( "V" )
		end
    end

end )