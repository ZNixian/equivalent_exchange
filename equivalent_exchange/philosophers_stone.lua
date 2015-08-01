local modname = "equivalent_exchange:"

-- Registering Craft Items --

minetest.register_craftitem(modname.."philosophers_stone", {
	description = "Philosopher's Stone",
	inventory_image = "equivalent_exchange_philosophers_stone.png",
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

--Transmutation Crafts here after default EMCs are sorted out --

