-- Registering Craft Items --

minetest.register_craftitem("equivalent_exchange:philosophers_stone", {
	description = "Philosopher's Stone",
	inventory_image = "equivalent_exchange_philosophers_stone.png",
	emc = 8892,
})

minetest.register_craft({
	output = "equivalent_exchange:philosophers_stone",
	recipe = {
		{"default:mese", "default:desert_stone", "default:mese"},
		{"default:desert_stone", "default:diamond", "default:mese"},
		{"default:mese", "default:desert_stone", "default:mese"}
	}
})

--Transmutation Crafts here after default EMCs are sorted out --

