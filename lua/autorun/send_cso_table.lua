-- This file is incorrectly named.

--[[
	This hook was supposed to play different footstep sounds,
	but due to issues in predition (I can assume), it never worked.
]]--
hook.Add( "PlayerFootstep", "CustomJobFootsteps", function( ply, pos, foot, snd, vol, rf )
	--[[

	if SERVER then
	
		if ply:Team() == TEAM_SOLDIER or ply:Team() == TEAM_ELITE or ply:Team() == TEAM_GUARD or ply:Team() == TEAM_STRIPPED then
			ply:EmitSound( "npc/combine_soldier/gear" .. math.random( 1, 6 ) .. ".wav" )
			return true
		end
		if ply:Team() == TEAM_POLICE then
			ply:EmitSound( "npc/metropolice/gear" .. math.random( 1, 6 ) .. ".wav" )
			return true
		end
		if ply:getJobTable().category == "Monsters" then
			ply:EmitSound( "npc/zombie/foot" .. math.random( 1, 3 ) .. ".wav" )
			return true
		end
		
	end
	
	]]
end )

--[[
	This hook fixed the missing-texture hands issue with the Battle QBB-95.
]]--
hook.Add( "PostDrawViewModel", "SetHandsOnBattle", function( vm, ply, wep )

	if IsValid( wep ) and wep:GetClass() == "tfa_cso_bqbb95" then
		ply:GetViewModel():SetSubMaterial( 1, "models/weapons/tfa_cso/bqbb95/#256252hand" )
	end

end )

if SERVER then
	--[[
		Random tips that would pop up when you died
		since AnkoRP is so unique~
	]]--
	local ANKORP_TIPS = {
		"Switching to another weapon is typically faster than reloading!",
		"You can carry more than one weapon per slot!",
		"Babygod lasts for ten seconds unless you shoot!",
		"\"Babygod popping\" only deals 50% damage!",
		"Higher killstreaks award you with more money per kill!",
		"Killing players with more kills awards you with more money!",
		"Smaller weapons award you with more money!",
		"Monsters gain full health when they kill someone!",
		"Use console command st_ping_loc to call out locations to your team!",
		"The Vs over players' heads are your teammates!",
		"These tips only show up 25% of the time!"
	}
	
	hook.Add( "PlayerDeath", "DifferentKillSounds", function( vic, inf, atk )
		if math.random( 1, 4 ) == 1 then
			DarkRP.notify( vic, 0, 10, "Tip: " .. table.Random( ANKORP_TIPS ) )
		end
	
		-- Custom death sounds based on which job you were.
		if vic:getJobTable().category == "Monsters" then
			vic:EmitSound( "npc/zombie/zombie_pain" .. math.random( 1, 6 ) .. ".wav" )
		end
		
		if vic:Team() == TEAM_SOLDIER or vic:Team() == TEAM_ELITE or vic:Team() == TEAM_GUARD then
			vic:EmitSound( "npc/combine_soldier/die" .. math.random( 1, 3 ) .. ".wav" )
		end
		
		if vic:Team() == TEAM_POLICE then
			vic:EmitSound( "npc/metropolice/die" .. math.random( 1, 4 ) .. ".wav" )
		end
		
		if vic:Team() == TEAM_ALYX then
			vic:EmitSound( "vo/npc/alyx/uggh0" .. math.random( 1, 2 ) .. ".wav" )
		end
		
		if vic:Team() == TEAM_BARNEY then
			vic:EmitSound( "vo/npc/barney/ba_pain0" .. math.random( 1, 9 ) .. ".wav" )
		end
		
		if vic:Team() == TEAM_GRIGORI then
			vic:EmitSound( "vo/ravenholm/monk_pain0" .. math.random( 1, 9 ) .. ".wav" )
		end
	end )
end