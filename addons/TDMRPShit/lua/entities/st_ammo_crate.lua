--[[
    This box just gives you ammo when you hit E on it.
    It's very simple.
]]--

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Resupply Crate"
ENT.Author= "Throneco"
ENT.Contact= "http://discord.gg/Tg8SUDv"
ENT.Purpose= ""
ENT.Instructions= ""
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Throneco Stuff"

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end

if SERVER then
    function ENT:Initialize()
    
        self:SetModel( "models/Items/ammocrate_smg1.mdl" )
        --models/props/cs_assault/MoneyPallet02.mdl - some full
        --models/props/cs_assault/MoneyPallet.mdl - fully full
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
    
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then phys:Wake() end
        self:SetUseType(SIMPLE_USE)

    end
    
    function ENT:Use( act, ply )
        if ply:GetActiveWeapon():GetMaxClip1() < 1 then
            DarkRP.notify( ply, 1, 4, "This weapon doesn't have a magazine!" )
        else
            self:EmitSound( "items/ammo_pickup.wav" )
            ply:SetAmmo( math.max( ply:GetActiveWeapon():GetMaxClip1() * 3, ply:GetAmmoCount( ply:GetActiveWeapon():GetPrimaryAmmoType() ) ), ply:GetActiveWeapon():GetPrimaryAmmoType() )
            DarkRP.notify( ply, 0, 4, "Refilled ammo!" )
        end
    end

end