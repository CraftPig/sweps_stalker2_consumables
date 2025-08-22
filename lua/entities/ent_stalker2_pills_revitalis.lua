if not file.Exists("lua/AIS/AIS_Items.lua","GAME") then return end

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Revitalis Initializers"
ENT.Author = "Craft_Pig"
ENT.Spawnable = true
ENT.Category = "S.T.A.L.K.E.R. 2"
ENT.IconOverride = "materials/entities/weapon_stalker2_pills_revitalis.png"

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/weapons/sweps/stalker2/pills/w_item_pills.mdl")
		self:SetSkin(0)
		self:PhysicsInit(SOLID_VPHYSICS	)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetModelScale(1.3)
	end
	local phys = self:GetPhysicsObject()
        if phys:IsValid() then
        phys:Wake()
        phys:SetMass(50)
        -- phys:EnableMotion(true)
        -- phys:EnableDrag(false)
        phys:SetDamping(0, 0)
    end
end

function ENT:Use(activator, caller)
	if (not IsValid(activator) or not activator:IsPlayer()) then return end
	if activator:GetAmmoCount("regenerator") >= 9999 then
		activator:PrintMessage( HUD_PRINTCENTER, "Ammo full" )
	return end
	
	activator:AddAISItem("STALKER2Revitalis",false)
	activator:GiveAmmo( 1, "regenerator", false )
	
	self:Remove() 
end