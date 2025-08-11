if CLIENT then 
    SWEP.WepSelectIcon = surface.GetTextureID( "vgui/hud/vgui_stalker2_sausage" )
	SWEP.BounceWeaponIcon = true 
    SWEP.DrawWeaponInfoBox = true
end

SWEP.PrintName = "Sausage"
SWEP.Author = "Craft_Pig"
SWEP.Purpose = 
[[
]]
SWEP.Category = "S.T.A.L.K.E.R. 2"
-- SWEP.Category1 = "EFT"
-- SWEP.Category2 = "Medkits"

SWEP.ViewModelFOV = 55
SWEP.ViewModel = "models/weapons/sweps/stalker2/sausage/v_item_sausage.mdl"
SWEP.WorldModel = "models/weapons/sweps/stalker2/sausage/w_item_sausage.mdl"
SWEP.UseHands = true
SWEP.DrawCrosshair = false 

SWEP.Spawnable = true
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 5
SWEP.SlotPos = 11

SWEP.SwayScale = 0.15
SWEP.BobScale = 0.75

SWEP.Secondary.Ammo = "none"
SWEP.Primary.Ammo = "sausage"
SWEP.Primary.ClipSize = -1
SWEP.Primary.Automatic = false

if file.Exists("lua/AIS/AIS_Items.lua","GAME") then
	SWEP.Primary.DefaultClip = 0
	SWEP.DrawAmmo = false
else
	SWEP.Primary.DefaultClip = 1
	SWEP.DrawAmmo = true
end

local ID_WEAPON = "weapon_stalker2_sausage"
local ID_PRIMARYAMMO = "sausage"

function SWEP:Initialize()
    self:SetHoldType("slam")
end 

function SWEP:Deploy()
    local owner = self:GetOwner() 
	
	self:SendWeaponAnim(ACT_VM_IDLE)
	
	-- if owner:GetAmmoCount(self.Primary.Ammo) == 0 then -- Strip Fallback 	
		-- owner:StripWeapon(ID_WEAPON)
		-- owner:SelectWeapon(owner:GetPreviousWeapon())
	-- end
	
	---------- Start Consumable ----------
	self.Consuming = 1
	self:InitializeConsumable()
	--------------------------------------
	return true
end

function SWEP:InitializeConsumable()
    local owner = self:GetOwner()
    if not IsValid(owner) or not owner:IsPlayer() then return end

    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	local SequenceDuration = self:SequenceDuration()

    timer.Simple(SequenceDuration * 0.3, function() -- Call item effects.
        if IsValid(owner) and owner:Alive() then
			self:Heal(owner)
			owner:RemoveAmmo(1, ID_PRIMARYAMMO) 
        end
    end)
	
	timer.Simple(SequenceDuration * 0.75, function() -- Call item effects.
        if IsValid(owner) and owner:Alive() then
			self:Heal(owner)
        end
    end)

    timer.Simple(SequenceDuration, function() -- End of logic, strip weapon.
        if IsValid(owner) and owner:Alive() then
            self.Consuming = 0
			
			if owner:GetAmmoCount(self.Primary.Ammo) == 0 or file.Exists("lua/AIS/AIS_Items.lua","GAME") then 	
				owner:StripWeapon(ID_WEAPON)
			end
			if SERVER then owner:SelectWeapon(owner:GetPreviousWeapon()) end
        end
    end)
end

function SWEP:Heal(owner)
	if IsValid(owner) and owner:GetActiveWeapon():GetClass() == ID_WEAPON then
	
		if file.Exists("lua/SEF/SEF_Functions.lua","GAME") and SERVER then
			owner:ApplyEffect("Healing", 1.45, 1, 0.5)
		end
		
		if file.Exists("lua/autorun/auxpower/core/power.lua","GAME") then
		end
		
		if file.Exists("lua/autorun/ojsshared.lua","GAME") then
		end
	end
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Think()
end

function SWEP:Holster()
	if self.Consuming == 1 then return end
	return true
end

function SWEP:PostDrawViewModel( vm )
    local attachment = vm:GetAttachment(1)
    if attachment then
        self.vmcamera = vm:GetAngles() - attachment.Ang
    else
        self.vmcamera = Angle(0, 0, 0) 
    end
end

function SWEP:CalcView( ply, pos, ang, fov )
	self.vmcamera = self.vmcamera or Angle(0, 0, 0)  
    return pos, ang + self.vmcamera, fov
end

if CLIENT then -- Worldmodel offset
	local WorldModel = ClientsideModel(SWEP.WorldModel)

	WorldModel:SetSkin(0)
	WorldModel:SetNoDraw(true)

	function SWEP:DrawWorldModel()
		local owner = self:GetOwner()

		if (IsValid(owner)) then
			local offsetVec = Vector(3, -3, 1)
			local offsetAng = Angle(-0, -0, -90)
			
			local boneid = owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
			if !boneid then return end

			local matrix = owner:GetBoneMatrix(boneid)
			if !matrix then return end

			local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())

			WorldModel:SetPos(newPos)
			WorldModel:SetAngles(newAng)

            WorldModel:SetupBones()
		else
			
			WorldModel:SetPos(self:GetPos())
			WorldModel:SetAngles(self:GetAngles())
			self:DrawModel()
		end

		WorldModel:DrawModel()

	end
end