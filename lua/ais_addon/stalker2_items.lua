if not file.Exists("lua/AIS/AIS_Items.lua","GAME") then return end

AIS_Items.STALKER2MedkitGeneral = {
        Icon = "materials/entities/weapon_stalker2_medkit.png",
        Name = "Medkit",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>Even if they're past their expiration date, medkits can handle basic first aid, but expecting anything more than that could be deadly. </color>\n\n" ..
                    "<color=0,200,0>Recovers most of your lost HP in an instant.</color>\n                                        " ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("medkit_general")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("medkit_general") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_medkit_army" then return end
			
			ply:Give("weapon_stalker2_medkit")
			ply:SelectWeapon("weapon_stalker2_medkit")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("medkit_general") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	 
AIS_Items.STALKER2MedkitArmy = {
        Icon = "materials/entities/weapon_stalker2_medkit_army.png",
        Name = "Army Medkit",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>This kit has all the essentials needed to deal with shrapnel, bullet wounds, and other battlefield injuries. Fortunately, thanks to the IPSF presence in the Zone, anyone can get their hands on these kits.</color>\n\n" ..
                    "<color=0,200,0>Recovers all of your lost HP in an instant and removes bleeding.</color>\n                                        " ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("medkit_army")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("medkit_army") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_medkit_army" then return end
			
			ply:Give("weapon_stalker2_medkit_army")
			ply:SelectWeapon("weapon_stalker2_medkit_army")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("medkit_army") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2MedkitScientific = {
        Icon = "materials/entities/weapon_stalker2_medkit_scientific.png",
        Name = "Scientific Medkit",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>The experimental drugs included in these kits can work wonders, but keep in mind that many of them haven't undergone clinical testing yet. Use them at your own risk.</color>\n\n" ..
                    "<color=0,200,0>Recovers all of your lost HP in an instant and removes bleeding.</color>\n                                        " ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("medkit_scientific")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("medkit_scientific") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_medkit_scientific" then return end
			
			ply:Give("weapon_stalker2_medkit_scientific")
			ply:SelectWeapon("weapon_stalker2_medkit_scientific")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("medkit_scientific") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Bread = {
        Icon = "materials/entities/weapon_stalker2_bread.png",
        Name = "Bread",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>A staple of the stalker diet. Following the takeover of Rostok. Myklukha became the Zone's principal bread supplier. How an ordinary loaf of bread stays fresh for such an extended period of time is one of the greatest mysteries of the Zone.</color>\n\n" ..
                    "<color=0,200,0>Heals very little health with each bite.</color>\n                                        " ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("medkit_scientific")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("bread") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_bread" then return end
			
			ply:Give("weapon_stalker2_bread")
			ply:SelectWeapon("weapon_stalker2_bread")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("bread") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Sausage = {
        Icon = "materials/entities/weapon_stalker2_sausage.png",
        Name = "Sausage",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>The key advantage of this sausage is its long shelf life. It's best not to speculate on how this is achieved in order to avoid ruining your appetite and those of others.</color>\n\n" ..
                    "<color=0,200,0>Heals a bit of health with each bite.</color>\n                                        " ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("sausage")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("sausage") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_sausage" then return end
			
			ply:Give("weapon_stalker2_sausage")
			ply:SelectWeapon("weapon_stalker2_sausage")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("sausage") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Milk = {
        Icon = "materials/entities/weapon_stalker2_milk.png",
        Name = "Condensed Milk",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>Considered a Zone delicacy, it is often taken on extended expeditions and occasionally used as bait for mutants, which also have a bit of a sweet tooth.</color>\n\n" ..
                    "<color=0,200,0>Recovers a good amount of health with one sip.</color>\n                                        " ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("milk")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("milk") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_milk" then return end
			
			ply:Give("weapon_stalker2_milk")
			ply:SelectWeapon("weapon_stalker2_milk")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("milk") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Canned = {
        Icon = "materials/entities/weapon_stalker2_canned.png",
        Name = "Canned Food",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>The contents of these cans is a mystery that no one dares delve into for the sake of their own sanity. Once healed over a campfire, they transform into a tasty, nutritious meal.</color>\n\n" ..
                    "<color=0,200,0>Heals a decent amount of health with each bite</color>\n						" ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("canned")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("canned") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_canned" then return end
			
			ply:Give("weapon_stalker2_canned")
			ply:SelectWeapon("weapon_stalker2_canned")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("canned") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Water = {
        Icon = "materials/entities/weapon_stalker2_water.png",
        Name = "Water",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>Finding clean water in the Zone is no easy task, since all natural resources there are contaminated with radiation. Fortunately, this isn't an issue on the Mainland yet.</color>\n\n" ..
                    "<color=0,200,0>Replenishes some lost endurance.</color>\n"																	 ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("water")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("water") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_water" then return end
			
			ply:Give("weapon_stalker2_water")
			ply:SelectWeapon("weapon_stalker2_water")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("water") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Vodka = {
        Icon = "materials/entities/weapon_stalker2_vodka.png",
        Name = "Vodka",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>A must-have alcoholic drink produced by GSC, renowned for it's ability to flush radiation from the body. It's also and excellent remedy against the tedium of everyday life in the Zone.</color>\n\n" ..
                    "<color=0,200,0>Doesn't really do anything.</color>\n"																	 ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("vodka")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("vodka") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_vodka" then return end
			
			ply:Give("weapon_stalker2_vodka")
			ply:SelectWeapon("weapon_stalker2_vodka")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("vodka") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }
	
AIS_Items.STALKER2Energy = {
        Icon = "materials/entities/weapon_stalker2_energy.png",
        Name = "Energy Drink",
        Description = function(ply)
			return string.format(
                    "<color=200,200,200>Featuring an enhanced formular comprised of caffeine, taurine and vitamins C, B5, B6, B9 and extended raids in the Zone.</color>\n\n" ..
                    "<color=0,200,0>Replenishes a lot of lost endurance and gives a small speed bost.</color>\n"																	 ..	
                    "<color=150,200,255>Remaining:</color> <color=255,255,100>%d</color> unit(s)",
                    ply:GetAmmoCount("energy")
                )
		end,
        Slot = "Item",
        OnEquip = function(ply, item) end,
        OnUnEquip = function(ply, item) end,
        WhenWearing = function(ply, item) end,
        OnUse = function(ply, item)
		
			if ply:GetAmmoCount("energy") == 0 then ply:RemoveAISItem(item, true) return end
			if ply:GetActiveWeapon(ply:GetClass()) == "weapon_stalker2_energy" then return end
			
			ply:Give("weapon_stalker2_energy")
			ply:SelectWeapon("weapon_stalker2_energy")	
			ply:ConCommand("Open_AIS_Inventory ")
			
			if ply:GetAmmoCount("energy") <= 1 then ply:RemoveAISItem(item, true) end
			
        end,
        ClientHooks = {},
        ServerHooks = {},
        ShowInMenu = true
    }