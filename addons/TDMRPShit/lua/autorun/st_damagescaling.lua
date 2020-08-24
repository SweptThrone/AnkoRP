-- let's fuckin go

hook.Add( "ScalePlayerDamage", "FriendlyFire/CitizenFie", function( vic, _, dmg )

	-- friendly fire and civilian shots deal zero damage
    if vic:getJobTable() then

        if dmg:GetAttacker():getJobTable() and vic:getJobTable().category == dmg:GetAttacker():getJobTable().category then
            dmg:ScaleDamage( 0 )
            dmg:GetAttacker():PrintMessage( HUD_PRINTCENTER, "Watch your fire!  You hit a teammate!" )
        end

        if vic:getJobTable().category == "Citizens" then
            dmg:ScaleDamage( 0 )
            dmg:GetAttacker():PrintMessage( HUD_PRINTCENTER, "Watch your fire!  Civilians are not combatants!" )
        end
		
		if dmg:GetAttacker():getJobTable().category == "Citizens" then
			dmg:ScaleDamage( 0 )
            dmg:GetAttacker():PrintMessage( HUD_PRINTCENTER, "Do not attack people as a civilian!" )
		end
		
		if dmg:GetAttacker().Babygod then
            dmg:GetAttacker().Babygod = nil
			dmg:GetAttacker():SetRenderMode( RENDERMODE_NORMAL )
			dmg:GetAttacker():GodDisable()
		end
		
		if vic.Babygod then
			dmg:ScaleDamage( 0 )
            dmg:GetAttacker():PrintMessage( HUD_PRINTCENTER, "Slow down!  They are still spawning!" )
		end

		-- this never actually worked
		-- its intention is obvious
		if dmg:GetAttacker().Babygod then
			dmg:ScaleDamage( 0.5 )
			dmg:GetAttacker():PrintMessage( HUD_PRINTCENTER, "Baby-god pop!  50% damage!" )
		end
		
		-- monster health siphon
		-- because they're weak and worthless
		if dmg:GetAttacker():getJobTable().category == "Monsters" then
			dmg:GetAttacker():SetHealth( math.Clamp( dmg:GetAttacker():Health() + dmg:GetDamage(), 0, 150 ) )
		end
		
    end

end )

hook.Add( "KeyPress", "KillBabygodWhenFire", function( ply, key )

	-- a very shitty way to lose babygod when "attacking" so you can't be invincible when attacking fresh-spawn
	if SERVER then
		if ply:Alive() and IsValid( ply:GetActiveWeapon() ) and key == IN_ATTACK and string.sub( ply:GetActiveWeapon():GetClass(), 1, 3 ) == "tfa" and ply:GetActiveWeapon():CanPrimaryAttack() then
			--[[hook.Add( "ScalePlayerDamage", "BabyGodPop", function( vic, _, dmg )
				if dmg:GetAttacker() == ply then
					dmg:ScaleDamage( 0.5 )
					dmg:GetAttacker():PrintMessage( HUD_PRINTCENTER, "Baby-god pop!  50% damage!" )
				end
			end )]]
			ply.Babygod = nil
			ply:SetRenderMode( RENDERMODE_NORMAL )
			ply:GodDisable()
			--[[hook.Remove( "ScalePlayerDamage", "BabyGodPop" )]]
		end
	end

end )

hook.Add( "PlayerFootstep", "NoStepWhenWalkAndCrouch", function( ply, pos, foot, sound, vol, rf )

	-- stealth

	if IsValid( ply ) and ( ply:Crouching() or ply:GetMaxSpeed() < 150 ) and ply:getJobTable() then
		return true
	else
		--if SERVER then
	
			-- also custom footsteps
			-- if you read these comments in the order i wrote them, you know i struggled with this already
			-- not really sure what changed

			if ply:Team() == TEAM_SOLDIER or ply:Team() == TEAM_ELITE or ply:Team() == TEAM_GUARD or ply:Team() == TEAM_STRIPPED then
				if SERVER then ply:EmitSound( "npc/combine_soldier/gear" .. math.random( 1, 6 ) .. ".wav", 75, 100, 0.5 ) end
				return true
			end
			if ply:Team() == TEAM_POLICE then
				if SERVER then ply:EmitSound( "npc/metropolice/gear" .. math.random( 1, 6 ) .. ".wav", 75, 100, 0.5 ) end
				return true
			end
			if ply:getJobTable().category == "Monsters" then
				if SERVER then ply:EmitSound( "npc/zombie/foot" .. math.random( 1, 3 ) .. ".wav", 75, 100, 0.5 ) end
				return true
			end
			
		--end
	end

end )

if SERVER then

    hook.Add("PlayerChangedTeam", "SaveKillsInSameTeam", function( ply, old, new )

		if !RPExtraTeams then return end
		if old == 0 or old == 1001 or new == 0 or new == 1001 then return end

        local oldTeam = -1
		local newTeam = -1
		
		for k,v in pairs( RPExtraTeams ) do
			print( "old: " .. old .. " new: " .. new )
			if v.team == old then
				print( "OLD " .. v.team .. " is equal to " .. old )
				oldTeam = v
			end
			if v.team == new then
				print( "NEW " ..v.team .. " is equal to " .. new )
				newTeam = v
			end
		end
		if newTeam.category != oldTeam.category then
			ply:SetFrags( 0 )
		end
    end )
	
	hook.Add( "GetFallDamage", "NoChellFDamage", function( ply, _ )
		if ply:Team() == TEAM_CHELL then return 0 end
	end )

end
