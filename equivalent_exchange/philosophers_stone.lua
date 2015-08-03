local modname = "equivalent_exchange:"

-- Registering Craft Items --

minetest.register_craftitem(modname.."philosophers_stone", {
	description = "Philosopher's Stone",
	inventory_image = "ee_philosophers_stone.png",
	emc = 8892,
})

-- Registering Crafts -- 

minetest.register_craft({
	output = modname.."philosophers_stone",
	recipe = {
		{"default:mese", "default:desert_stone", "default:mese"},
		{"default:desert_stone", "default:diamond", "default:mese"},
		{"default:mese", "default:desert_stone", "default:mese"}
	}
})

--Transmutation Crafts --

minetest.register_craft({
	type = "shapeless",
	output = "default:steel_ingot 4",
	recipe = {modname.."philosophers_stone", "default:gold_ingot"},
	replacements = {
		{modname.."philosophers_stone", modname.."philosophers_stone"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:gold_ingot",
	recipe = {modname.."philosophers_stone", "default:steel_ingot", "default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	replacements = {
		{modname.."philosophers_stone", modname.."philosophers_stone"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:gold_ingot 2",
	recipe = {modname.."philosophers_stone", "default:diamond"},
	replacements = {
		{modname.."philosophers_stone", modname.."philosophers_stone"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:diamond",
	recipe = {modname.."philosophers_stone", "default:gold_ingot", "default:gold_ingot"},
	replacements = {
		{modname.."philosophers_stone", modname.."philosophers_stone"}
	}
})
