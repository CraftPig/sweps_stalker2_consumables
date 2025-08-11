AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Food Crate"
ENT.Author = "Craft_Pig"
ENT.Spawnable = true
ENT.Category = "S.T.A.L.K.E.R. 2"

ENT.WeaponPool = {
    "weapon_stalker2_bread",
	"weapon_stalker2_sausage",
	"weapon_stalker2_canned",
	"weapon_stalker2_milk",
	"weapon_stalker2_water",
	"weapon_stalker2_energy",
	"weapon_stalker2_vodka",
}
-- ENT.WeaponPool2 = {
    -- "weapon_stalker2_bread",
	-- "weapon_stalker2_sausage",
	-- "weapon_stalker2_canned",
	-- "weapon_stalker2_milk",
-- }

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/props/stalker2/wood_crate_02/w_wood_crate_02.mdl")
		self:PhysicsInit(SOLID_VPHYSICS	)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetModelScale(1)
	end
	local phys = self:GetPhysicsObject()
        if phys:IsValid() then
        phys:Wake()
        phys:SetMass(20)
        -- phys:EnableMotion(true)
        -- phys:EnableDrag(false)
        -- phys:SetDamping(0, 0)
    end
		
	self.Used = 0
end

function ENT:Use(activator, caller)
	if (not IsValid(activator) or not activator:IsPlayer()) or self.Used == 1 then return end
	
	self.Used = 1
	self:SetBodygroup( 0, 1 )
	
	self:EmitSound("physics/wood/wood_furniture_break" .. math.random(1,2) .. ".wav")
	
	local RepeatAmount = math.random(1,4)
	for i =1,RepeatAmount do
	
		local weaponClass = self.WeaponPool[math.random(#self.WeaponPool)]
		
		if weaponClass == self.WeaponPool[1] then -- Bread
			if SERVER then
				activator:Give("weapon_stalker2_bread", false)
				activator:GiveAmmo(math.random(2,6), "bread")
			end	
		end
		if weaponClass == self.WeaponPool[2] then -- Sausage
			if SERVER then
				activator:Give("weapon_stalker2_sausage", false)
				activator:GiveAmmo( math.random(1,4), "sausage")
			end	
		end
		if weaponClass == self.WeaponPool[3] then -- Canned
			if SERVER then
				activator:Give("weapon_stalker2_canned", false)
				activator:GiveAmmo( math.random(1,3), "canned")
			end	
		end
		if weaponClass == self.WeaponPool[4] then -- Milk
			if SERVER then
				activator:Give("weapon_stalker2_milk", false)
				activator:GiveAmmo(math.random(1,2), "milk")
			end	
		end
		if weaponClass == self.WeaponPool[5] then -- Water
			if SERVER then
				activator:Give("weapon_stalker2_water", false)
				activator:GiveAmmo(math.random(1,4), "water")
			end	
		end
		if weaponClass == self.WeaponPool[6] then -- Energy
			if SERVER then
				activator:Give("weapon_stalker2_energy", false)
				activator:GiveAmmo(math.random(1,3), "energy")
			end	
		end
		if weaponClass == self.WeaponPool[7] then -- Vodka
			if SERVER then
				activator:Give("weapon_stalker2_vodka", false)
				activator:GiveAmmo(math.random(1,2), "vodka")
			end	
		end
	end
	-- print(#self.WeaponPool) -- prints numbers of table entries
end