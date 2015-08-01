local modname = "equivalent_exchange_extras:"
-- Registering Craft Items --

minetest.register_craftitem(modname.."talisman_of_repair", {
	description = "Talisman of Repair",
	inventory_image = "ee_extras_talisman_of_repair.png",
	stack_max = 1,
	emc = 10000, 
})

-- Registering Crafts --

minetest.register_craft({
	output = modname.."talisman_of_repair",
	recipe = {
		{"equivalent_exchange:low_covalence", "equivalent_exchange:medium_covalence", "equivalent_exchange:high_covalence"},
		{"farming:string", "wool:white", "farming:string"},
		{"equivalent_exchange:high_covalence", "equivalent_exchange:medium_covalence", "equivalent_exchange:low_covalence"}
	}
})