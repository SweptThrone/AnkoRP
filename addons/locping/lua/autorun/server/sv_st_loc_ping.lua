--[[
    This is an edited version of my Location Pinging addon
    specifically for AnkoRP, where pings are all team-specific.

    Pretty sure I just commented out everything I didn't need for this.
]]--

util.AddNetworkString( "swepts_ping_sys_tosv" )
util.AddNetworkString( "swepts_ping_sys_tocl" )
util.AddNetworkString( "swepts_ping_update_status_tosv" )
util.AddNetworkString( "swepts_ping_update_status_tocl" )

net.Receive( "swepts_ping_sys_tosv", function( len, ply )
    
    local vec = net.ReadVector()
    --local whitelist = net.ReadTable()
    local senders = RecipientFilter()

    for k,v in pairs( player.GetAll() ) do
        if v:getJobTable().category == ply:getJobTable().category and ply:getJobTable().category != "Citizens" then
            senders:AddPlayer( v )
        end
    end
    senders:AddPlayer( ply )

    net.Start( "swepts_ping_sys_tocl" )
        net.WriteVector( vec )
        net.WriteEntity( ply )
    net.Send( senders )

end )

net.Receive( "swepts_ping_update_status_tosv", function( len, ply )

    local REQUEST_SEND = 0
    local REQUEST_CANCEL = 1
    local REQUEST_ACCEPT = 2
    local REQUEST_STOP = 3

    local typ = net.ReadInt( 3 )
    local receiv = net.ReadEntity()

    print( ply )
    print( receiv )

    net.Start( "swepts_ping_update_status_tocl" )
        net.WriteInt( typ, 3 )
        net.WriteEntity( ply )
        net.WriteEntity( receiv )
    net.Send( { ply, receiv } )

end )