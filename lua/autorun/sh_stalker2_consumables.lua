AddCSLuaFile()

--[[
-----------------------------------------------------------------------------------------------------
Hooks
-----------------------------------------------------------------------------------------------------
]]

if CLIENT then
	hook.Add("AIS_InventoryTriggered", "HookGiveMissingStalker2Consumables", function(ply, isopen)
		if IsValid(ply) and ply:Alive() then
			net.Start("network_givemissingstalker2consumables")
			net.WriteBool(isopen)
			net.SendToServer()
		end
	end)
end


if SERVER then
	util.AddNetworkString("network_givemissingstalker2consumables")
	net.Receive("network_givemissingstalker2consumables", function(len, ply)
		local isopen = net.ReadBool() 

		if ply:GetAmmoCount("bread") >=2 then ply:AddAISItem("STALKER2Bread",false) end
		if ply:GetAmmoCount("sausage") >=2 then ply:AddAISItem("STALKER2Sausage",false) end
		if ply:GetAmmoCount("canned") >=2 then ply:AddAISItem("STALKER2Canned",false) end
		if ply:GetAmmoCount("milk") >=2 then ply:AddAISItem("STALKER2Milk",false) end
		if ply:GetAmmoCount("medkit_general") >=2 then ply:AddAISItem("STALKER2MedkitGeneral",false) end
		if ply:GetAmmoCount("medkit_army") >=2 then ply:AddAISItem("STALKER2MedkitArmy",false) end
		if ply:GetAmmoCount("medkit_scientific") >=2 then ply:AddAISItem("STALKER2MedkitScientific",false) end
		if ply:GetAmmoCount("water") >=2 then ply:AddAISItem("STALKER2Water",false) end
		if ply:GetAmmoCount("vodka") >=2 then ply:AddAISItem("STALKER2Vodka",false) end
		if ply:GetAmmoCount("energy") >=2 then ply:AddAISItem("STALKER2Energy",false) end
		if ply:GetAmmoCount("bandage") >=2 then ply:AddAISItem("STALKER2Bandage",false) end
		if ply:GetAmmoCount("antirad") >=2 then ply:AddAISItem("STALKER2Antirad",false) end
		
		if ply:GetAmmoCount("regenerator") >=2 then ply:AddAISItem("STALKER2Revitalis",false) end
		if ply:GetAmmoCount("enhancers") >=2 then ply:AddAISItem("STALKER2Endurance",false) end
		
	end)
	

	hook.Add("EntityTakeDamage", "HookStalker2ConsumablesDmg", function(target, dmg)
		if IsValid(target) and target:IsPlayer() and not target:IsBot() then
			
            local expire = target:GetNW2Float("Stalker2ConsumablesRadiationTimer", 0)
            if CurTime() >= expire then
                target:SetNW2Float("Stalker2ConsumablesRadiationDmg", 0)
            end
			
			local dmgTable = { 
				DMG_RADIATION,
				DMG_NERVEGAS,
				DMG_POISON,
				DMG_ACID,
			}
			for _, dmgType in pairs(dmgTable) do
				if dmg:IsDamageType(dmgType) then
					target:SetNW2Float("Stalker2ConsumablesRadiationTimer", CurTime() + 30)

					local currentDmg = target:GetNW2Float("Stalker2ConsumablesRadiationDmg")
					target:SetNW2Float("Stalker2ConsumablesRadiationDmg", currentDmg + dmg:GetDamage())
				end
			end
			-- print("Tot Dmg: " .. target:GetNW2Float("Stalker2ConsumablesRadiationDmg"))
        end
	end)
	
	-- hook.Add("Think", "HookStalker2ConsumablesThink", function()
	
	-- end)
end

--[[
-----------------------------------------------------------------------------------------------------
Convars
-----------------------------------------------------------------------------------------------------
]]

-- if CLIENT then
	-- CreateClientConVar("cl_eftmeds_quick", "0", true, false)
-- end
-- concommand.Add("use_stalker2_alcohol", function(ply, cmd, args)
    -- if not IsValid(ply) or not ply:IsPlayer() then return end
	-- if ply:GetAmmoCount("vodka") > 0 then
		-- if ply:HasWeapon("weapon_stalker2_vodka") then
			-- ply:SelectWeapon("weapon_stalker2_vodka")
		-- else
			-- ply:Give("weapon_stalker2_vodka")
			-- ply:SelectWeapon("weapon_stalker2_vodka")
		-- end
	-- end
-- end)

--[[
-----------------------------------------------------------------------------------------------------
Ammo Tables
-----------------------------------------------------------------------------------------------------
]]

game.AddAmmoType( {
name = "water",
} )
game.AddAmmoType( {
name = "bread",
} )
game.AddAmmoType( {
name = "vodka",
} )
game.AddAmmoType( {
name = "milk",
} )
game.AddAmmoType( {
name = "antirad",
} )
game.AddAmmoType( {
name = "medkit_general",
} )
game.AddAmmoType( {
name = "medkit_army",
} )
game.AddAmmoType( {
name = "medkit_scientific",
} )
game.AddAmmoType( {
name = "canned",
} )
game.AddAmmoType( {
name = "sausage",
} )
game.AddAmmoType( {
name = "energy",
} )
game.AddAmmoType( {
name = "bandage",
} )
game.AddAmmoType( {
name = "blockers",
} )
game.AddAmmoType( {
name = "enhancers",
} )
game.AddAmmoType( {
name = "regenerator",
} )

--[[
-----------------------------------------------------------------------------------------------------
Sound Tables
-----------------------------------------------------------------------------------------------------
]]

----------------------------------------------------------------------------------------------------- Cloth
sound.Add( {
    name = "Stalker2.ClothGeneric",
    channel = CHAN_STATIC,
    volume = 0.4,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/cloth/short/SFX_PlayerClothes_01.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_02.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_03.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_04.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_05.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_06.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_07.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_08.mp3",
		"weapons/stalker2/cloth/short/SFX_PlayerClothes_09.mp3",
    }
} )


----------------------------------------------------------------------------------------------------- Antirad
sound.Add( {
    name = "Stalker2.AntiradButton",
    channel = CHAN_WEAPON,
    volume = 0.7,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/antirad/S_Consumables_Antirad_Button_01 (SFX).ogg",
    }
} )
sound.Add( {
    name = "Stalker2.AntiradCap",
    channel = CHAN_WEAPON,
    volume = 0.7,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/antirad/S_Consumables_Antirad_Cap_01 (SFX).ogg",
    }
} )
sound.Add( {
    name = "Stalker2.AntiradInject",
    channel = CHAN_WEAPON,
    volume = 0.7,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/antirad/S_Consumables_Antirad_Inject_01 (SFX).ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Pills
sound.Add( {
    name = "Stalker2.Gulp",
    channel = CHAN_ITEM,
    volume = 0.7,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/pills/gulp.ogg",
    }
} )
sound.Add( {
    name = "Stalker2.PillsDrop",
    channel = CHAN_STATIC,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/pills/S_Consumables_Pills_Drop_01 (SFX).ogg",
    }
} )
sound.Add( {
    name = "Stalker2.PillsEat",
    channel = CHAN_STATIC,
    volume = 0.2,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/pills/S_Consumables_Pills_Eat_01 (SFX).ogg",
    }
} )
sound.Add( {
    name = "Stalker2.PillsOpen",
    channel = CHAN_STATIC,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/pills/S_Consumables_Pills_Open_01 (SFX).ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Bandage
sound.Add( {
    name = "Stalker2.BandageOpen",
    channel = CHAN_WEAPON,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/bandage/S_Consumables_Bandage_Open_01 (SFX).ogg",
		"weapons/stalker2/bandage/S_Consumables_Bandage_Open_02 (SFX).ogg",
		"weapons/stalker2/bandage/S_Consumables_Bandage_Open_03 (SFX).ogg",
    }
} )
sound.Add( {
    name = "Stalker2.BandagePick",
    channel = CHAN_ITEM,
    volume = 0.15,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/bandage/S_Consumables_Bandage_Pick_01 (SFX).ogg",
		"weapons/stalker2/bandage/S_Consumables_Bandage_Pick_02 (SFX).ogg",
		"weapons/stalker2/bandage/S_Consumables_Bandage_Pick_03 (SFX).ogg",
    }
} )
sound.Add( {
    name = "Stalker2.BandageRoll",
    channel = CHAN_WEAPON,
    volume = 0.25,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/bandage/S_Consumables_Bandage_Roll_01 (SFX).ogg",
		"weapons/stalker2/bandage/S_Consumables_Bandage_Roll_02 (SFX).ogg",
		"weapons/stalker2/bandage/S_Consumables_Bandage_Roll_03 (SFX).ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Vodka
sound.Add( {
    name = "Stalker2.VodkaOn",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/vodka/SFX_Vodka_CapOn_01.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_CapOn_02.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_CapOn_03.mp3",
    }
} )
sound.Add( {
    name = "Stalker2.VodkaOff",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/vodka/SFX_Vodka_Cap_01.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Cap_02.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Cap_03.mp3",
    }
} )
sound.Add( {
    name = "Stalker2.VodkaScrew",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/vodka/SFX_Vodka_Screw_01.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Screw_02.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Screw_03.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Screw_04.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Screw_05.mp3",
		"weapons/stalker2/vodka/SFX_Vodka_Screw_06.mp3",
    }
} )

----------------------------------------------------------------------------------------------------- Drink
sound.Add( {
    name = "Stalker2.Liquid",
    channel = CHAN_BODY,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/drink/SFX_Vodka_Liquid_01.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_02.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_03.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_04.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_05.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_06.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_07.mp3",
		"weapons/stalker2/drink/SFX_Vodka_Liquid_08.mp3",
    }
} )
sound.Add( {
    name = "Stalker2.Drink",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 65,
    pitch = {95, 100},
    sound = {
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_02.mp3",
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_03.mp3",
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_04.mp3",
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_05.mp3",
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_06.mp3",
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_07.mp3",
		"weapons/stalker2/drink/SFX_Consumables_Common_Drink_08.mp3",
    }
} )

----------------------------------------------------------------------------------------------------- Beer
sound.Add( {
    name = "Stalker2.BeerOpen",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/drink/SFX_Consumables_BeerOpen.mp3",
    }
} )
sound.Add( {
    name = "Stalker2.BeerCapOff",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/drink/SFX_Consumables_Beer_CapOff.mp3",
    }
} )

----------------------------------------------------------------------------------------------------- Bread
sound.Add( {
    name = "Stalker2.Bread",
    channel = CHAN_WEAPON,
    volume = 0.5,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/bread/SFX_Consumables_Bread_Bite_01.mp3",
		"weapons/stalker2/bread/SFX_Consumables_Bread_Bite_02.mp3",
		"weapons/stalker2/bread/SFX_Consumables_Bread_Bite_03.mp3",
		"weapons/stalker2/bread/SFX_Consumables_Bread_Bite_04.mp3",
		"weapons/stalker2/bread/SFX_Consumables_Bread_Bite_05.mp3",
		"weapons/stalker2/bread/SFX_Consumables_Bread_Bite_06.mp3",
    }
} )
----------------------------------------------------------------------------------------------------- Drink
sound.Add( {
    name = "Stalker2.Milk",
    channel = CHAN_WEAPON,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/milk/SFX_Milk_Knife_1.ogg",
		"weapons/stalker2/milk/SFX_Milk_Knife_2.ogg",
		"weapons/stalker2/milk/SFX_Milk_Knife_3.ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Medkit
sound.Add( {
    name = "Stalker2.Healing",
    channel = CHAN_WEAPON,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/medkit/SFX_Medkit_Healing_1.ogg",
		"weapons/stalker2/medkit/SFX_Medkit_Healing_2.ogg",
		"weapons/stalker2/medkit/SFX_Medkit_Healing_3.ogg",
    }
} )
sound.Add( {
    name = "Stalker2.Inject",
    channel = CHAN_BODY,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/medkit/SFX_Medkit_Inject_1.ogg",
    }
} )
sound.Add( {
    name = "Stalker2.Cap",
    channel = CHAN_WEAPON,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/medkit/SFX_Medkit_Cap_1.ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Canned
sound.Add( {
    name = "Stalker2.CannedPrick",
    channel = CHAN_WEAPON,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/canned/SFX_Canned_Prick_1.ogg",
		"weapons/stalker2/canned/SFX_Canned_Prick_2.ogg",
		"weapons/stalker2/canned/SFX_Canned_Prick_3.ogg",
    }
} )
sound.Add( {
    name = "Stalker2.CannedOpen",
    channel = CHAN_BODY,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/canned/SFX_Canned_Open.ogg",
    }
} )
sound.Add( {
    name = "Stalker2.CannedLid",
    channel = CHAN_BODY,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/canned/SFX_Canned_Lid.ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Sausage
sound.Add( {
    name = "Stalker2.Sausage",
    channel = CHAN_WEAPON,
    volume = 0.4,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/sausage/SFX_Sausage_1.ogg",
		"weapons/stalker2/sausage/SFX_Sausage_2.ogg",
		"weapons/stalker2/sausage/SFX_Sausage_3.ogg",
		"weapons/stalker2/sausage/SFX_Sausage_4.ogg",
    }
} )
----------------------------------------------------------------------------------------------------- Energy
sound.Add( {
    name = "Stalker2.EnergyOpen",
    channel = CHAN_WEAPON,
    volume = 1,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/energy/SFX_CA_Energy_Open_1.ogg",
		"weapons/stalker2/energy/SFX_CA_Energy_Open_2.ogg",
		"weapons/stalker2/energy/SFX_CA_Energy_Open_3.ogg",
    }
} )
sound.Add( {
    name = "Stalker2.EnergyShake",
    channel = CHAN_WEAPON,
    volume = 0.15,
    level = 65,
    pitch = {95, 100},
    sound = {
        "weapons/stalker2/energy/SFX_CA_Energy_Shake_1.ogg",
		"weapons/stalker2/energy/SFX_CA_Energy_Shake_2.ogg",
		"weapons/stalker2/energy/SFX_CA_Energy_Shake_3.ogg",
    }
} )