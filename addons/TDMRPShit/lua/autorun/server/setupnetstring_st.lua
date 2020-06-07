-- This file is also an absolute clusterfuck

util.AddNetworkString( "ST_OpenLoadoutMenu" )
util.AddNetworkString( "ST_SetLoadout" )

util.AddNetworkString( "ST_OpenInventoryMenu" )
util.AddNetworkString( "ST_InventoryTransaction" )

util.AddNetworkString( "ST_OpenUpgradeMenu" )
util.AddNetworkString( "ST_UpgradeWeapon" )

util.AddNetworkString( "ST_OpenDowngradeMenu" )
util.AddNetworkString( "ST_DowngradeWeapon" )

util.AddNetworkString( "AllowTreeToBeSeen" )
util.AddNetworkString( "SendTimeUntilScore" )

CSO_WEAPONS_TREE = util.JSONToTable( file.Read( "cso_weapons_with_prices.json" ) )

-- starting scores
local FINAL_SCORES = {
    ["CT"] = 0,
    ["TR"] = 0,
    ["CM"] = 0,
    ["RE"] = 0
}

-- convenience
local KEY_TO_CATEGORY = {
    ["CT"] = "Counter-Terrorists",
    ["TR"] = "Terrorists",
    ["CM"] = "Combine",
    ["RE"] = "Resistance"
}

-- i'll explain this later
local die = 0

hook.Add( "Initialize", "SetupTDMRPDir", function()
    if !file.Exists( "ankorp", "DATA" ) then
        file.CreateDir( "ankorp" )
    end

    -- disallow dropping expensive and high-tier weapons
    GAMEMODE.Config.DisallowDrop = GAMEMODE.Config.DisallowDrop or {}

    for k,v in pairs( CSO_WEAPONS_TREE ) do
        if v.deep > 1 or v.price > 99999 then
            GAMEMODE.Config.DisallowDrop[ k ] = true
        end
    end

    -- i could've used this to control round times on the fly, but i don't think it worked
    local ROUND_TIME = 600

    -- the timer has a nme for a reason
    timer.Create( "CollectScoresEvery10min", ROUND_TIME, 0, function()
    
        local SCORE_CT, SCORE_TR, SCORE_CM, SCORE_RE = 0, 0, 0, 0

		local numTeammates = {
            ["CT"] = 0,
            ["TR"] = 0,
            ["CM"] = 0,
            ["RE"] = 0
		}
		
        -- depending on which team a player is on, add to the number
        for k,v in pairs( player.GetAll() ) do
            if v:getJobTable().category == "Counter-Terrorists" then
				numTeammates[ "CT" ] = numTeammates[ "CT" ] + 1
                SCORE_CT = SCORE_CT + v:Frags()
            elseif v:getJobTable().category == "Terrorists" then
				numTeammates[ "TR" ] = numTeammates[ "TR" ] + 1
                SCORE_TR = SCORE_TR + v:Frags()
            elseif v:getJobTable().category == "Combine" then
				numTeammates[ "CM" ] = numTeammates[ "CM" ] + 1
                SCORE_CM = SCORE_CM + v:Frags()
            elseif v:getJobTable().category == "Resistance" then
				numTeammates[ "RE" ] = numTeammates[ "RE" ] + 1
                SCORE_RE = SCORE_RE + v:Frags()
            end
        end

        local scores = { 
            ["CT"] = SCORE_CT,
            ["TR"] = SCORE_TR,
            ["CM"] = SCORE_CM,
            ["RE"] = SCORE_RE
        }
		
		local round_winners = {}

        if scores[ "CT" ] == scores[ "TR" ] and scores[ "TR" ] == scores[ "CM" ] and scores[ "CM" ] == scores[ "RE" ] then --4way tie
            die = 0 -- i'm too stupid to know exactly what would happen if i returned here, so i just do some throwaway shit
            -- this is so fucking retarded why can't i just be good at shit

        --[[
            I told myself and everyone I knew
            "It's okay if I use a bunch of shitty if statments,
            who's gonna see this code anyway?"
            Now look where we are.

            Anyway these shitty stacks just figure out who wins.
        ]]--
        elseif scores[ "CT" ] == scores[ "TR" ] and scores[ "TR" ] == scores[ "CM" ] and table.GetWinningKey( scores ) != "RE" then --3way tie; CT/TR/CM
            FINAL_SCORES[ "CT" ] = FINAL_SCORES[ "CT" ] + 1
            FINAL_SCORES[ "TR" ] = FINAL_SCORES[ "TR" ] + 1
            FINAL_SCORES[ "CM" ] = FINAL_SCORES[ "CM" ] + 1
			table.insert( round_winners, "CT" )
			table.insert( round_winners, "TR" )
			table.insert( round_winners, "CM" )
			
        elseif scores[ "CT" ] == scores[ "TR" ] and scores[ "TR" ] == scores[ "RE" ] and table.GetWinningKey( scores ) != "CM" then --3way tie; CT/TR/RE
            FINAL_SCORES[ "CT" ] = FINAL_SCORES[ "CT" ] + 1
            FINAL_SCORES[ "TR" ] = FINAL_SCORES[ "TR" ] + 1
            FINAL_SCORES[ "RE" ] = FINAL_SCORES[ "RE" ] + 1
			table.insert( round_winners, "CT" )
			table.insert( round_winners, "TR" )
			table.insert( round_winners, "RE" )
			
        elseif scores[ "RE" ] == scores[ "TR" ] and scores[ "TR" ] == scores[ "CM" ] and table.GetWinningKey( scores ) != "CT" then --3way tie; RE/TR/CM
            FINAL_SCORES[ "RE" ] = FINAL_SCORES[ "RE" ] + 1
            FINAL_SCORES[ "TR" ] = FINAL_SCORES[ "TR" ] + 1
            FINAL_SCORES[ "CM" ] = FINAL_SCORES[ "CM" ] + 1
			table.insert( round_winners, "RE" )
			table.insert( round_winners, "TR" )
			table.insert( round_winners, "CM" )
			
        elseif scores[ "RE" ] == scores[ "CT" ] and scores[ "CT" ] == scores[ "CM" ] and table.GetWinningKey( scores ) != "TR" then --3way tie; RE/CT/CM
            FINAL_SCORES[ "RE" ] = FINAL_SCORES[ "RE" ] + 1
            FINAL_SCORES[ "CT" ] = FINAL_SCORES[ "CT" ] + 1
            FINAL_SCORES[ "CM" ] = FINAL_SCORES[ "CM" ] + 1
			table.insert( round_winners, "RE" )
			table.insert( round_winners, "CT" )
			table.insert( round_winners, "CM" )
			
        elseif scores[ "RE" ] == scores[ "CT" ] and ( table.GetWinningKey( scores ) != "CM" and table.GetWinningKey( scores ) != "TR" ) then --2way tie, RE/CT
            FINAL_SCORES[ "RE" ] = FINAL_SCORES[ "RE" ] + 1
            FINAL_SCORES[ "CT" ] = FINAL_SCORES[ "CT" ] + 1
			table.insert( round_winners, "RE" )
			table.insert( round_winners, "CT" )
			
        elseif scores[ "RE" ] == scores[ "CM" ] and ( table.GetWinningKey( scores ) != "CT" and table.GetWinningKey( scores ) != "TR" ) then --2way tie, RE/CM
            FINAL_SCORES[ "RE" ] = FINAL_SCORES[ "RE" ] + 1
            FINAL_SCORES[ "CM" ] = FINAL_SCORES[ "CM" ] + 1
			table.insert( round_winners, "RE" )
			table.insert( round_winners, "CM" )
			
        elseif scores[ "RE" ] == scores[ "TR" ] and ( table.GetWinningKey( scores ) != "CM" and table.GetWinningKey( scores ) != "CT" ) then --2way tie, RE/TR
            FINAL_SCORES[ "RE" ] = FINAL_SCORES[ "RE" ] + 1
            FINAL_SCORES[ "TR" ] = FINAL_SCORES[ "TR" ] + 1
			table.insert( round_winners, "RE" )
			table.insert( round_winners, "TR" )
			
        elseif scores[ "TR" ] == scores[ "CT" ] and ( table.GetWinningKey( scores ) != "CM" and table.GetWinningKey( scores ) != "RE" ) then --2way tie, TR/CT
            FINAL_SCORES[ "TR" ] = FINAL_SCORES[ "TR" ] + 1
            FINAL_SCORES[ "CT" ] = FINAL_SCORES[ "CT" ] + 1
			table.insert( round_winners, "TR" )
			table.insert( round_winners, "CT" )
			
        elseif scores[ "TR" ] == scores[ "CM" ] and ( table.GetWinningKey( scores ) != "RE" and table.GetWinningKey( scores ) != "CT" ) then --2way tie, TR/CM
            FINAL_SCORES[ "TR" ] = FINAL_SCORES[ "TR" ] + 1
            FINAL_SCORES[ "CM" ] = FINAL_SCORES[ "CM" ] + 1
			table.insert( round_winners, "TR" )
			table.insert( round_winners, "CM" )
			
        elseif scores[ "CM" ] == scores[ "CT" ] and ( table.GetWinningKey( scores ) != "RE" and table.GetWinningKey( scores ) != "TR" ) then --2way tie, CM/CT
            FINAL_SCORES[ "CM" ] = FINAL_SCORES[ "CM" ] + 1
            FINAL_SCORES[ "CT" ] = FINAL_SCORES[ "CT" ] + 1
			table.insert( round_winners, "CM" )
			table.insert( round_winners, "CT" )
			
        else
            FINAL_SCORES[ table.GetWinningKey( scores ) ] = FINAL_SCORES[ table.GetWinningKey( scores ) ] + 1
			table.insert( round_winners, table.GetWinningKey( scores ) )
		end
		
        -- Add money to winning players for winning a "round"
        -- do the math, i don't remember
		for k,v in pairs( player.GetAll() ) do
			for a,b in pairs( round_winners ) do
				if v:getJobTable().category == KEY_TO_CATEGORY[ b ] then
					local numEnemies = scores[ "CT" ] + scores[ "TR" ] + scores[ "CM" ] + scores[ "RE" ]
					v:addMoney( 12500 + ( 2500 * ( numTeammates[ b ] - 1 ) ) * ( v:Frags() / scores[ b ] ) )
				end
			end
			v:SetFrags( 0 )
		end
		
		
        net.Start( "SendTimeUntilScore" )
            net.WriteInt( ROUND_TIME, 32 )
            net.WriteData( util.Compress( util.TableToJSON( FINAL_SCORES ) ), #util.Compress( util.TableToJSON( FINAL_SCORES ) ) )
			net.WriteBool( true )
        net.Broadcast()

    end )

    -- god
    -- this is to make sure the client-side timer is accurate as can be
	timer.Create( "EnsureTimerIntegrity", 10, 0, function()
		net.Start( "SendTimeUntilScore" )
            net.WriteInt( timer.TimeLeft( "CollectScoresEvery10min" ), 32 )
            net.WriteData( util.Compress( util.TableToJSON( FINAL_SCORES ) ), #util.Compress( util.TableToJSON( FINAL_SCORES ) ) )
			net.WriteBool( false )
        net.Broadcast()
	end )
	
end )

hook.Add( "PlayerInitialSpawn", "AssignOrSetupInventory", function( ply )

    -- i stored weapons n shit in txt files
    -- oopsie, hehe~
    if !file.Exists( "ankorp/" .. ply:SteamID64() .. ".txt", "DATA" ) then
        ply.wepInvTable = {}
        for k,v in pairs( CSO_WEAPONS_TREE ) do
            if v.deep == 1 then
                ply.wepInvTable[ k ] = "nil"
            end
        end
        file.Write( "ankorp/" .. ply:SteamID64() .. ".txt", util.TableToJSON( ply.wepInvTable ) )
    end

    ply.wepInvTable = util.JSONToTable( file.Read( "ankorp/" .. ply:SteamID64() .. ".txt" ) )

    -- make absolutely sure that the player is loaded and has what they need
    -- i'm sure this is REALLY bad
    -- but who cares
    timer.Simple( 10, function()
        -- see darkrp_customthings/shipments.lua
        local CSO_WEAPONS_TREE = file.Read( "cso_weapons_with_prices.json" )
        net.Start( "AllowTreeToBeSeen" )
            net.WriteData( util.Compress( CSO_WEAPONS_TREE ), #util.Compress( CSO_WEAPONS_TREE ) )
        net.Send( ply )
        net.Start( "SendTimeUntilScore" )
            net.WriteInt( timer.TimeLeft( "CollectScoresEvery10min" ) or 0, 32 )
            net.WriteData( util.Compress( util.TableToJSON( FINAL_SCORES ) ), #util.Compress( util.TableToJSON( FINAL_SCORES ) ) )
        net.Send( ply )
    end )


end )

hook.Add( "PlayerDeath", "GiveMoneyForKills", function( vic, inf, atk )

    -- penalize players for improper killing
    -- it's really hard but never impossible
    if atk:IsPlayer() and atk != vic then
        
        if vic:getJobTable().category == "Citizens" then
            if atk:getJobTable().category == "Terrorists" or atk:getJobTable().category == "Combine" then
                atk:PrintMessage( HUD_PRINTCENTER, "There are targets more important than civilians!" )
                atk:PrintMessage( HUD_PRINTCONSOLE, "Penalized 1 frag for unnecessary killing." )
                atk:AddFrags( -2 )
            else
                atk:PrintMessage( HUD_PRINTCENTER, "Do not kill civilians!" )
                atk:PrintMessage( HUD_PRINTCONSOLE, "Penalized $5,000 and 1 frag for wrongful killing." )
                atk:AddFrags( -2 )
                atk:addMoney( -5000 )
            end
        elseif vic:getJobTable().category == atk:getJobTable().category then
            atk:PrintMessage( HUD_PRINTCENTER, "Do not kill your teammates!" )
            atk:PrintMessage( HUD_PRINTCONSOLE, "Penalized $2,500 and 1 frag for teamkill." )
            atk:AddFrags( -2 )
            atk:addMoney( -2500 )
        elseif atk:getJobTable().category == "Citizens" then
            atk:PrintMessage( HUD_PRINTCENTER, "Do not kill as a citizen!" )
            atk:PrintMessage( HUD_PRINTCONSOLE, "Penalized $10,000 for wrongful killing." )
            atk:addMoney( -10000 )
        else
            -- monsters siphon health because they're so weak and worthless
			if atk:getJobTable().category == "Monsters" then
				atk:SetHealth( 150 )
			end
		
            -- money based on weapon class, target's kills, and killstreak
			local wep = atk:GetActiveWeapon()
			local slot
            if wep then slot = wep.Slot + 1 end
            if slot == 1 then
                atk:addMoney( ( math.random( 1500, 2500 ) + math.max( 0, vic:Frags() ) * 500 ) * ( 1 + atk:GetNWInt( "CurrKillStreak", 0 ) / 10 ) )
            elseif slot == 2 then
                atk:addMoney( ( math.random( 1000, 1500 ) + math.max( 0, vic:Frags() ) * 300 ) * ( 1 + atk:GetNWInt( "CurrKillStreak", 0 ) / 10 ) )
                atk:GiveAmmo( wep:GetMaxClip1(), wep:GetPrimaryAmmoType() )
            elseif slot == 3 then
                atk:addMoney( ( math.random( 250, 500 ) + math.max( 0, vic:Frags() ) * 100  ) * ( 1 + atk:GetNWInt( "CurrKillStreak", 0 ) / 10 ) )
                atk:GiveAmmo( wep:GetMaxClip1(), wep:GetPrimaryAmmoType() )
            elseif slot == 4 then
                atk:addMoney( ( math.random( 150, 250 ) + math.max( 0, vic:Frags() ) * 50  ) * ( 1 + atk:GetNWInt( "CurrKillStreak", 0 ) / 10 ) )
                atk:GiveAmmo( wep:GetMaxClip1() / 2, wep:GetPrimaryAmmoType() )
            elseif slot == 5 then
                atk:addMoney( ( math.random( 50, 100 ) + math.max( 0, vic:Frags() ) * 25  ) * ( 1 + atk:GetNWInt( "CurrKillStreak", 0 ) / 10 ) )
                atk:GiveAmmo( wep:GetMaxClip1() / 2, wep:GetPrimaryAmmoType() )
            else
                atk:addMoney( ( math.random( 500, 1000 ) + math.max( 0, vic:Frags() ) * 250  ) * ( 1 + atk:GetNWInt( "CurrKillStreak", 0 ) / 10 ) )
            end
        end
        
    end

end )