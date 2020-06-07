--[[
    Join/Disconnect messsages I always use on my servers.
    I think I "stole" most of this from somewhere else so I haven't published it.
]]--


local BASE_TEXT_COLOR = Color( 255, 255, 128 ) --yellow
local PLAYER_TEXT_COLOR = Color( 128, 255, 128 )
local STATUS_COLOR = Color( 255, 128, 128 )

net.Receive( "print_ply_connect", function()

    local newply = net.ReadString()
    chat.AddText( PLAYER_TEXT_COLOR, newply, BASE_TEXT_COLOR, " has connected." )

end )

net.Receive( "print_ply_disconnect", function()

    local newply = net.ReadString()
    local reason = net.ReadString()
    local id = net.ReadInt( 32 )
    if IsValid( Player( id ) ) then
        chat.AddText( PLAYER_TEXT_COLOR, newply, BASE_TEXT_COLOR, " has left the server." )
    else
        chat.AddText( PLAYER_TEXT_COLOR, newply, BASE_TEXT_COLOR, " disconnected." )
    end
    print( reason )

end )

hook.Add( "ChatText", "hidejoinandleave", function( x, y, z, typ )

    return typ == "joinleave"

end )