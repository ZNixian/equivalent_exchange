--Registering Craft Items--

minetest.register_craftitem("equivalent_exchange:low_covalence", {
	description = "Low Covalence Dust",
	inventory_image = "equivalent_exchange_low_covalence.png",
	emc = 1,
})

minetest.register_craftitem("equivalent_exchange:medium_covalence", {
	description = "Medium Covalence Dust",
	inventory_image = "equivalent_exchange_medium_covalence.png",
	emc = 8,
})

minetest.register_craftitem("equivalent_exchange:high_covalence", {
	description = "High Covalence Dust",
	inventory_image = "equivalent_exchange_high_covalence.png",
	emc = 208,
})

-- Registering Crafts --

minetest.register_craft({
	type = "shapeless",
	output = "equivalent_exchange:low_covalence",
	recipe = {"default:cobble", "default:cobble", "default:cobble","default:cobble", "default:cobble", "default:cobble","default:cobble", "default:cobble", "default:coal_lump"}
})

minetest.register_craft({
	type = "shapeless",
	output = "equivalent_exchange:medium_covalence",
	recipe = {"default:steel_ingot", "default:bronze_ingot"}
})

minetest.register_craft({
	type = "shapeless",
	output = "equivalent_exchange:high_covalence",
	recipe = {"default:diamond", "default:mese_crystal"}
})