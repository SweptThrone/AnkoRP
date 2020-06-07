--[[
    Join/Disconnect messsages I always use on my servers.
    I think I "stole" most of this from somewhere else so I haven't published it.
]]--

util.AddNetworkString( "print_ply_connect" )
util.AddNetworkString( "print_ply_disconnect" )

hook.Add( "PlayerConnect", "ConnectMessages", function( name, ip )

    net.Start( "print_ply_connect" )
        net.WriteString( name )
    net.Broadcast()

end )

gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "DisConnectMessages", function( dat )

    net.Start( "print_ply_disconnect" )
        net.WriteString( dat.name )
        net.WriteString( dat.reason )
        net.WriteInt( dat.userid, 32 )
    net.Broadcast()

end )