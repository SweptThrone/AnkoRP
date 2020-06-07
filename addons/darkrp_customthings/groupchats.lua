--[[
    AnkoRP custom group chats.
]]--

GAMEMODE:AddGroupChat( function( ply ) return ply:getJobTable().category == "Counter-Terrorists" end )
GAMEMODE:AddGroupChat( function( ply ) return ply:getJobTable().category == "Terrorists" end )
GAMEMODE:AddGroupChat( function( ply ) return ply:getJobTable().category == "Combine" end )
GAMEMODE:AddGroupChat( function( ply ) return ply:getJobTable().category == "Resistance" end )
GAMEMODE:AddGroupChat( function( ply ) return ply:getJobTable().category == "Monsters" end )