--[[
	I was asked to recreate a HUD from "KDGaming" I think.
	I didn't think it was terrible, so I used it for AnkoRP.

	This version actually also contains an optimization for the money flash,
	making this whole HUD client-bound (as it should be).
]]--

local smoothHP = 100
local smoothAP = 100
local smoothClip = 100
local smoothCash = 0

surface.CreateFont( "KDGDisplayFont", {
	font = "Arial",
	size = 20,
	weight = 5000
} )
surface.CreateFont( "BigKDGDisplayFont", {
	font = "Arial",
	size = 40,
	weight = 5000
} )
surface.CreateFont( "AmmoKDGDisplayFont", {
	font = "Arial",
	size = 26,
	weight = 5000
} )
surface.CreateFont( "KDGWantedFont", {
	font = "Arial",
	size = 32,
	weight = 5000
} )

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

local money_last_frame = 0
local timesincelastdrop = 0
local timesincelastmoney = 0

hook.Add( "HUDPaint", "DrawKDGHUD", function()

	local ply = LocalPlayer()
	local hp = LocalPlayer():Health()
	local ap = LocalPlayer():Armor()
	
	local color_hp = Color( 255, 0, 0 )
	local color_ap = Color( 0, 128, 255 )
	local color_bg = LocalPlayer():GetPlayerColor():ToColor()
	local color_wep = LocalPlayer():GetWeaponColor():ToColor()
	local color_barbg = Color( 86, 85, 86 )
	local color_text = color_bg
	local color_black = color_black

	local money_this_frame = LocalPlayer():getDarkRPVar( "money" ) or 0

	if money_last_frame > money_this_frame then
		timesincelastdrop = CurTime()
	elseif money_last_frame < money_this_frame then
		timesincelastmoney = CurTime()
	end

	local playerIcon = Material( "icon16/user.png" )
	local jobIcon = Material( "icon16/group.png" )
	local moneyIcon = Material( "icon16/money.png" )
	local salaryIcon = Material( "icon16/money_add.png" )
	local propIcon = Material( "icon16/group_link.png" )
	local killstreakIcon = Material( "icon16/fire.png" )
	local ksStar = Material( "icon16/star.png" )

	smoothHP = Lerp( 15 * FrameTime(), smoothHP, hp )
	smoothAP = Lerp( 15 * FrameTime(), smoothAP, ap )
	if LocalPlayer():getDarkRPVar( "money" ) != nil then
		smoothCash = Lerp( 5 * FrameTime(), smoothCash, LocalPlayer():getDarkRPVar( "money" ) )
	end
	
	-- background
	surface.SetDrawColor( color_black )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = 0, y = ScrH() - 158 },
		{ x = 264, y = ScrH() - 158 },
		{ x = 316, y = ScrH() - 105 },
		{ x = 316, y = ScrH() },
		{ x = 0, y = ScrH() }
	} )
	
	-- background foreground (grey)
	surface.SetDrawColor( color_bg )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = 3, y = ScrH() - 155 },
		{ x = 261, y = ScrH() - 155 },
		{ x = 313, y = ScrH() - 103 },
		{ x = 313, y = ScrH() - 3 },
		{ x = 3, y = ScrH() - 3 }
	} )

	-- hp background
	surface.SetDrawColor( color_black )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = 10, y = ScrH() - 148 },
		{ x = 254, y = ScrH() - 148 },
		{ x = 280, y = ScrH() - 123 },
		{ x = 10, y = ScrH() - 123 }
	} )
	-- hp background dark
	surface.SetDrawColor( color_barbg )
	draw.NoTexture()
	surface.DrawPoly( {
		{ x = 15, y = ScrH() - 143 },
		{ x = 249, y = ScrH() - 143 }, -- 249 - max width
		{ x = 267, y = ScrH() - 128 }, -- 267 - max width
		{ x = 15, y = ScrH() - 128 }
	} )

	-- ap background
	surface.SetDrawColor( color_black )
	draw.NoTexture()
	surface.DrawPoly( { // - 91
		{ x = 10, y = ScrH() - 116 },
		{ x = 287, y = ScrH() - 116 },
		{ x = 304, y = ScrH() - 100 },
		{ x = 304, y = ScrH() - 91 },
		{ x = 10, y = ScrH() - 91 }
	} )
	-- ap background dark
	surface.SetDrawColor( color_barbg )
	draw.NoTexture()
	surface.DrawPoly( { // - 91
		{ x = 15, y = ScrH() - 111 },
		{ x = 282, y = ScrH() - 111 }, -- 282 max width
		{ x = 299, y = ScrH() - 97 }, -- 299 max width
		{ x = 299, y = ScrH() - 96 },
		{ x = 15, y = ScrH() - 96 }
	} )

	-- name background
	draw.RoundedBox( 2, 10, ScrH() - 86, 294, 23, color_black )

	-- job background
	draw.RoundedBox( 2, 10, ScrH() - 60, 294, 23, color_black )
		
	-- money background
	draw.RoundedBox( 2, 10, ScrH() - 34, 294, 23, color_black )
	draw.RoundedBox( 2, 10, ScrH() - 34, 294, 23, Color( 28, 72, 29, math.Clamp( 255 - ( CurTime() - timesincelastmoney ) * 500, 0, 255 ) ) )
	draw.RoundedBox( 2, 10, ScrH() - 34, 294, 23, Color( 72, 28, 29, math.Clamp( 255 - ( CurTime() - timesincelastdrop ) * 500, 0, 255 ) ) )

	-- hp foreground
	surface.SetDrawColor( color_hp )
	draw.NoTexture()
	local hpXOne = smoothHP * ( 249 / LocalPlayer():GetMaxHealth() )
	if hp != 0 then
		surface.DrawPoly( {
			{ x = 15, y = ScrH() - 143 },
			{ x = hpXOne, y = ScrH() - 143 }, -- 249 - max width
			{ x = hpXOne + 18, y = ScrH() - 128 }, -- 267 - max width
			{ x = 15, y = ScrH() - 128 }
		} )
	end

	-- ap foreground
	surface.SetDrawColor( color_ap )
	draw.NoTexture()
	local apXOne = smoothAP * ( 282 / 150 )
	if ap != 0 then
		surface.DrawPoly( { // - 91
			{ x = 15, y = ScrH() - 111 },
			{ x = apXOne, y = ScrH() - 111 }, -- 282 max width
			{ x = apXOne + 17, y = ScrH() - 97 }, -- 299 max width
			{ x = apXOne + 17, y = ScrH() - 96 },
			{ x = 15, y = ScrH() - 96 }
		} )
	end

	-- name icon
	surface.SetDrawColor( color_white )
	surface.SetMaterial( playerIcon	)
	surface.DrawTexturedRect( 13, ScrH() - 82, 16, 16 )

	-- job icon
	surface.SetDrawColor( color_white )
	surface.SetMaterial( jobIcon )
	surface.DrawTexturedRect( 13, ScrH() - 56, 16, 16 )

	-- cash icon
	surface.SetDrawColor( color_white )
	surface.SetMaterial( moneyIcon )
	surface.DrawTexturedRect( 13, ScrH() - 30, 16, 16 )

	-- salary icon
	surface.SetDrawColor( color_white )
	surface.SetMaterial( salaryIcon )
	surface.DrawTexturedRect( 200, ScrH() - 30, 16, 16 )

	-- prop icon
	surface.SetDrawColor( color_white )
	surface.SetMaterial( propIcon )
	surface.DrawTexturedRect( 200, ScrH() - 56, 16, 16 )
	
	-- fire icon
	surface.SetDrawColor( ( CurTime() < ply:GetNWFloat( "LastKillTime", 0 ) + 4 and 255 or 0 ), ( CurTime() < ply:GetNWFloat( "LastKillTime", 0 ) + 4 and 255 or 0 ), ( CurTime() < ply:GetNWFloat( "LastKillTime", 0 ) + 4 and 255 or 0 ) )
	surface.SetMaterial( killstreakIcon )
	surface.DrawTexturedRect( 0, ScrH() - 200, 32, 32 )
	
	-- stars
	for i = 1, ply:GetNWInt( "CurrKillStreak", 0 ) do
		surface.SetDrawColor( color_white )
		surface.SetMaterial( ksStar )
		surface.DrawTexturedRect( 20 + ( i * 16 ), ScrH() - 192, 16, 16 )
	end
	
	if IsValid( LocalPlayer():GetActiveWeapon() ) then
		-- ammo background
		surface.SetDrawColor( color_black )
		draw.NoTexture()
		surface.DrawPoly( {
			{ x = ScrW() - 256, y = ScrH() - 64 },
			{ x = ScrW(), y = ScrH() - 64 },
			{ x = ScrW(), y = ScrH() },
			{ x = ScrW() - 266, y = ScrH() },
			{ x = ScrW() - 266, y = ScrH() - 54 }
		} )

		-- ammo background foreground (grey)
		surface.SetDrawColor( color_wep )
		draw.NoTexture()
		surface.DrawPoly( {
			{ x = ScrW() - 251, y = ScrH() - 59 },
			{ x = ScrW() - 5, y = ScrH() - 59 },
			{ x = ScrW() - 5, y = ScrH() - 5 },
			{ x = ScrW() - 261, y = ScrH() - 5 },
			{ x = ScrW() - 261, y = ScrH() - 49 }
		} )

		-- ammo number panels
		surface.SetDrawColor( color_black )
		draw.NoTexture()
		surface.DrawRect( ScrW() - 246, ScrH() - 48, 24, 36 )
		surface.DrawRect( ScrW() - 217, ScrH() - 48, 24, 36 )
		surface.DrawRect( ScrW() - 188, ScrH() - 48, 24, 36 )
		surface.DrawRect( ScrW() - 130, ScrH() - 48, 24, 24 )
		surface.DrawRect( ScrW() - 101, ScrH() - 48, 24, 24 )
		surface.DrawRect( ScrW() - 72, ScrH() - 48, 24, 24 )
		surface.DrawRect( ScrW() - 43, ScrH() - 48, 24, 24 )
	end

	--[[ ========= TEXTS START HERE ========= ]]--
	local TEAM_CAT_LUT = {
		[ "Counter-Terrorists" ] = "CT",
		[ "Terrorists" ] = "TR",
		[ "Resistance" ] = "RE",
		[ "Combine" ] = "CM",
		[ "Monsters" ] = "MN",
		[ "Citizens" ] = "CZ"
	}
	
	local TEAM_CAT_COLOR_LUT = {
		[ "Counter-Terrorists" ] = Color( 84, 109, 126 ),
		[ "Terrorists" ] = Color( 125, 61, 64 ),
		[ "Resistance" ] = Color( 243, 207, 47 ),
		[ "Combine" ] = Color( 63, 92, 205 ),
		[ "Monsters" ] = Color( 112, 173, 71 ),
		[ "Citizens" ] = Color( 0, 176, 80 )
	}

	draw.SimpleText( hp .. " HP", "KDGDisplayFont", 105, ScrH() - 144, color_black )
	draw.SimpleText( ap .. " AP", "KDGDisplayFont", 105, ScrH() - 112, color_black )
	draw.SimpleText( LocalPlayer():Name(), "KDGDisplayFont", 35, ScrH() - 83, color_white )
	draw.SimpleText( LocalPlayer():getDarkRPVar( "job" ), "KDGDisplayFont", 35, ScrH() - 57, color_white )
	draw.SimpleText( DarkRP.formatMoney( math.Round( smoothCash ) ), "KDGDisplayFont", 35, ScrH() - 31, color_white )
	draw.SimpleText( "+" .. DarkRP.formatMoney( LocalPlayer():getDarkRPVar( "salary" ) ), "KDGDisplayFont", 220, ScrH() - 31, color_white )
	draw.SimpleText( LocalPlayer():getJobTable() and TEAM_CAT_LUT[ LocalPlayer():getJobTable().category ] or "ERR", "KDGDisplayFont", 220, ScrH() - 57, LocalPlayer():getJobTable() and TEAM_CAT_COLOR_LUT[ LocalPlayer():getJobTable().category ] or color_white )

	if IsValid( LocalPlayer():GetActiveWeapon() ) then
		local amo1 = LocalPlayer():GetAmmoCount( LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType() )
		draw.SimpleText( amo1 % 10, "AmmoKDGDisplayFont", ScrW() - 37, ScrH() - 49, color_white )
		draw.SimpleText( math.floor( amo1 / 10 % 10 ), "AmmoKDGDisplayFont", ScrW() - 66, ScrH() - 49, color_white )
		draw.SimpleText( math.floor( amo1 / 100 % 10 ), "AmmoKDGDisplayFont", ScrW() - 95, ScrH() - 49, color_white )
		draw.SimpleText( math.floor( amo1 / 1000 % 10 ), "AmmoKDGDisplayFont", ScrW() - 124, ScrH() - 49, color_white )
		local clipp = LocalPlayer():GetActiveWeapon():Clip1()
		draw.SimpleText( clipp % 10, "BigKDGDisplayFont", ScrW() - 185, ScrH() - 49, color_white )
		draw.SimpleText( math.floor( clipp / 10 % 10 ), "BigKDGDisplayFont", ScrW() - 214, ScrH() - 49, color_white )
		draw.SimpleText( math.floor( clipp / 100 % 10 ), "BigKDGDisplayFont", ScrW() - 242, ScrH() - 49, color_white )

		draw.SimpleText( "/", "BigKDGDisplayFont", ScrW() - 152, ScrH() - 54, color_black )
	end

	if LocalPlayer():getAgendaTable() then
		-- background
		surface.SetDrawColor( Color( 0, 0, 0, 128 ) )
		draw.NoTexture()
		surface.DrawPoly( {
			{ x = 0, y = 0 },
			{ x = 480, y = 0 },
			{ x = 480, y = 160 },
			{ x = 460, y = 180 },
			{ x = 0, y = 180 }
		} )

		-- foreground
		surface.SetDrawColor( Color( 255, 255, 255, 32 ) )
		draw.NoTexture()
		surface.DrawPoly( {
			{ x = 10, y = 10 },
			{ x = 470, y = 10 },
			{ x = 470, y = 150 },
			{ x = 450, y = 170 },
			{ x = 10, y = 170 }
		} )

		-- title
		surface.SetDrawColor( color_black )
		draw.NoTexture()
		surface.DrawRect( 15, 15, 450, 30 )

		-- texts
		draw.SimpleText( LocalPlayer():getAgendaTable().Title, "KDGDisplayFont", 20, 20, color_white )
		agendaText = agendaText or DarkRP.textWrap((LocalPlayer():getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "KDGDisplayFont", 440)
		draw.DrawNonParsedText(agendaText, "KDGDisplayFont", 20, 47, color_white, 0)

	end

	money_last_frame = LocalPlayer():getDarkRPVar( "money" )

end )

--[[
net.Receive( "KDGMockWanted", function()

	local ply = net.ReadEntity()
	local cop = net.ReadEntity()
	local reason = net.ReadString()

	local title = ply:Name() .. " is wanted for " .. reason .. "!"
	local subtitle = "Issued by " .. cop:Name()

	hook.Add( "HUDPaint", "DrawKDGWanted", function()

		draw.NoTexture()
		surface.SetFont( "KDGWantedFont" )
		draw.RoundedBox( 8, ScrW()/2 - ( surface.GetTextSize( title ) + 50 ) / 2, 25, surface.GetTextSize( title ) + 50, 100, Color( 255, 0, 0, 64 ) )
		draw.SimpleText( title, "KDGWantedFont", ScrW()/2 - surface.GetTextSize( title )/2, 40, color_white )
		surface.SetFont( "AmmoKDGDisplayFont" )
		draw.SimpleText( subtitle, "AmmoKDGDisplayFont", ScrW()/2 - surface.GetTextSize( subtitle )/2, 80, color_white )

	end )

	timer.Create( "KDGWantedCLock", 3, 1, function()
		hook.Remove( "HUDPaint", "DrawKDGWanted" )
	end )

end )
]]

local hide = {
	CHudBattery = true,
	CHudHealth = true,
	CHudAmmo = true,
	CHudSecondaryAmmo = true
}

local hideHUDElements = {
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Agenda"] = true,
	["DarkRP_ArrestedHUD"] = true,
}

hook.Add( "HUDShouldDraw", "HideDefaults_KDGHUD", function(n)
	if hide[n] then return false end
	if hideHUDElements[name] then return false end
end )
