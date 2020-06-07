--[[
	This file's just a fuckin mess.
]]--

-- Create fonts we use later
surface.CreateFont( "UPGMed", {
    font = "Arial",
    size = 36,
    weight = 5000
} )

surface.CreateFont( "UPGSmall", {
    font = "Arial",
    size = 24,
    weight = 5000
} )

surface.CreateFont( "UPGMini", {
    font = "Arial",
    size = 18,
    weight = 5000
} )

surface.CreateFont( "STEventText", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 24,
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

-- Set up scores table even though it seems like these are nil
local DISPLAY_SCORES = {
    { tem = "CT", score = SCORE_CT },
    { tem = "TR", score = SCORE_TR },
    { tem = "CM", score = SCORE_CM },
    { tem = "RE", score = SCORE_RE }
}

-- See: darkrp_customthings/shipments.lua
net.Receive( "AllowTreeToBeSeen", function( len, ply )

    local tab = net.ReadData( len )

    CSO_WEAPONS_TREE = util.JSONToTable( util.Decompress( tab ) )

end )

--[[
	Receive the time left on the clock to display on the top.

	I've never really known how to sync round timers,
	so this might be a hack and a half.
]]--
net.Receive( "SendTimeUntilScore", function( len, ply )

    local tim = net.ReadInt( 32 )
    local scoresdat = net.ReadData( len )
	local isRoundOver = net.ReadBool() -- this is only true when the round actually ends, otherwise the player just joined

    local scores = util.JSONToTable( util.Decompress( scoresdat ) )

	-- compare what we got to what we have to tell who wins
	if isRoundOver then
		if scores[ "CT" ] > DISPLAY_SCORES[ "CT" ] then
			print( "Counter-Terrorists win" )
		elseif scores[ "TR" ] > DISPLAY_SCORES[ "TR" ] then
			print( "Terrorists win" )
		elseif scores[ "RE" ] > DISPLAY_SCORES[ "RE" ] then
			print( "Resistance wins" )
		elseif scores[ "CM" ] > DISPLAY_SCORES[ "CM" ] then
			print( "Combine wins" )
		end
	end
	
	-- set up the timer we got above
    timer.Create( "SetupTimerForScorePeriod", tim, 1, function() end )

    hook.Add( "HUDPaint", "STShowTimer", function()

		-- draw time left
        local txt = string.FormattedTime( timer.TimeLeft( "SetupTimerForScorePeriod" ) ).m .. ":" .. 
            ( string.FormattedTime( timer.TimeLeft( "SetupTimerForScorePeriod" ) ).s < 10 and "0" or "" ) .. string.FormattedTime( timer.TimeLeft( "SetupTimerForScorePeriod" ) ).s

		-- i can't actually remember what any of this is

		-- background
	surface.SetDrawColor( color_black )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = ScrW() / 2 - 70, y = 0 },
		{ x = ScrW() / 2 + 70, y = 0 },
		{ x = ScrW() / 2 + 40, y = 50 },
		{ x = ScrW() / 2 - 40, y = 50 }
	} )

	surface.DrawPoly( {
		{ x = ScrW() / 2 - 160, y = 0 },
		{ x = ScrW() / 2 + 160, y = 0 },
		{ x = ScrW() / 2 + 140, y = 35 },
		{ x = ScrW() / 2 - 140, y = 35 }
	} )

	surface.SetDrawColor( 84, 109, 126, 255 )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = ScrW() / 2 - 155, y = 0 },
		{ x = ScrW() / 2 - 116, y = 0 },
		{ x = ScrW() / 2 - 97, y = 30 },
		{ x = ScrW() / 2 - 136, y = 30 }
	} )

	surface.SetDrawColor( 125, 61, 64, 255 )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = ScrW() / 2 - 111, y = 0 },
		{ x = ScrW() / 2 - 72, y = 0 },
		{ x = ScrW() / 2 - 53, y = 30 },
		{ x = ScrW() / 2 - 92, y = 30 }
	} )

	surface.SetDrawColor( 63, 92, 205, 255 )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = ScrW() / 2 + 116, y = 0 },
		{ x = ScrW() / 2 + 155, y = 0 },
		{ x = ScrW() / 2 + 138, y = 30 },
		{ x = ScrW() / 2 + 96, y = 30 }
	} )

	surface.SetDrawColor( 243, 207, 47, 255 )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = ScrW() / 2 + 72, y = 0 },
		{ x = ScrW() / 2 + 111, y = 0 },
		{ x = ScrW() / 2 + 92, y = 30 },
		{ x = ScrW() / 2 + 53, y = 30 }
	} )

	surface.SetFont( "UPGMed" )
	surface.SetTextColor( color_white )
	surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( txt ) / 2 ), 5 )
	surface.DrawText( txt )

	surface.SetFont( "UPGSmall" )
	surface.SetTextColor( color_black )
	surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( scores[ "CT" ] ) / 2 ) - 127, 5 )
	surface.DrawText( scores[ "CT" ] )
	--[[surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( "00" ) / 2 ) - 120, 25 )
	surface.DrawText( "00" )]]

	surface.SetTextColor( color_black )
	surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( scores[ "TR" ] ) / 2 ) - 83, 5 )
	surface.DrawText( scores[ "TR" ] )
	--[[surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( "00" ) / 2 ) - 80, 25 )
	surface.DrawText( "00" )]]

	surface.SetTextColor( color_black )
	surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( scores[ "RE" ] ) / 2 ) + 80, 5 )
	surface.DrawText( scores[ "RE" ] )
	--[[surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( "00" ) / 2 ) + 80, 25 )
	surface.DrawText( "00" )]]

	surface.SetTextColor( color_black )
	surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( scores[ "CM" ] ) / 2 ) + 125, 5 )
	surface.DrawText( scores[ "CM" ] )
	--[[surface.SetTextPos( ScrW() / 2 - ( surface.GetTextSize( "00" ) / 2 ) + 120, 25 )
	surface.DrawText( "00" )]]	
		
		--[[ oh god oh fuck what is this
        surface.SetFont( "STEventText" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( txt ) / 2), 5 )
        surface.DrawText( txt )

        surface.SetTextColor( 84, 109, 126, 255 )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( "CT" ) / 2) - 60, 25 )
        surface.DrawText( "CT" )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( scores[ "CT" ] ) / 2) - 60, 45 )
        surface.DrawText( scores[ "CT" ] )

        surface.SetTextColor( 125, 61, 64, 255 )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( "TR" ) / 2) - 20, 25 )
        surface.DrawText( "TR" )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( scores[ "TR" ] ) / 2) - 20, 45 )
        surface.DrawText( scores[ "TR" ] )

        surface.SetTextColor( 63, 92, 205, 255 )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( "CM" ) / 2) + 20, 25 )
        surface.DrawText( "CM" )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( scores[ "CM" ] ) / 2) + 20, 45 )
        surface.DrawText( scores[ "CM" ] )

        surface.SetTextColor( 243, 207, 47, 255 )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( "RE" ) / 2) + 60, 25 )
        surface.DrawText( "RE" )
        surface.SetTextPos( ScrW() / 2 - (surface.GetTextSize( scores[ "RE" ] ) / 2) + 60, 45 )
        surface.DrawText( scores[ "RE" ] )
		]]
    end )

end )