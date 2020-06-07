--[[
    Modified version of my Simple Halo Killstreaks addon,
    making it networked so I can display stars on the HUD.
]]--

hook.Add( "PlayerDeath", "HaloNetKillStreaks", function( vic, wep, ply )

    vic:SetNWInt( "CurrKillStreak", 0 )
    vic:SetNWInt( "CurrKillRun", 0 )

    if vic != ply and IsValid( ply ) and ply:IsPlayer() then

        ply:SetNWInt( "CurrKillRun", ply:GetNWInt( "CurrKillRun", 1 ) )
        ply:SetNWInt( "CurrKillStreak", ply:GetNWInt( "CurrKillStreak", 1 ) )
        ply:SetNWInt( "CurrKillStreak", ply:GetNWInt( "CurrKillStreak" ) + 1 )

        if ply:GetNWFloat( "LastKillTime", nil ) != nil and CurTime() < ply:GetNWFloat( "LastKillTime" ) + 4 then
            ply:SetNWInt( "CurrKillRun", ply:GetNWInt( "CurrKillRun" ) + 1 )
        else
            ply:SetNWInt( "CurrKillRun", nil )
        end

        ply:SetNWFloat( "LastKillTime", CurTime() )

    end

end )