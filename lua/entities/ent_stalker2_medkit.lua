if not file.Exists("lua/AIS/AIS_Items.lua","GAME") then return end

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Medkit"
ENT.Author = "Craft_Pig"
ENT.Spawnable = true
ENT.Category = "S.T.A.L.K.E.R. 2"
ENT.IconOverride = "materials/entities/weapon_stalker2_medkit.png"

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/props/stalker2/healthbox/w_item_healthbox_1.mdl")
		self:PhysicsInit(SOLID_VPHYSICS	)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetModelScale(0.8)
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
	if activator:GetAmmoCount("medkit_general") >= 9999 then
		activator:PrintMessage( HUD_PRINTCENTER, "Ammo full" )
	return end
	
	activator:AddAISItem("STALKER2MedkitGeneral",false)
	activator:GiveAmmo( 1, "medkit_general", false )
	
	self:Remove() 
end