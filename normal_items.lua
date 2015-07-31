-- Registering Nodes --

minetest.register_node("equivalent_exchange:red_matter_block", {
	description = "Red Matter Block",
	tiles = {
		"equivalent_exchange_red_matter_block.png",
		"equivalent_exchange_red_matter_block.png",
		"equivalent_exchange_red_matter_block.png",
		"equivalent_exchange_red_matter_block.png",
		"equivalent_exchange_red_matter_block.png",
		"equivalent_exchange_red_matter_block.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	emc = 1253376
})

minetest.register_node("equivalent_exchange:antimatter_block", {
	description = "Antimatter Block",
	tiles = {
		"equivalent_exchange_antimatter_block.png",
		"equivalent_exchange_antimatter_block.png",
		"equivalent_exchange_antimatter_block.png",
		"equivalent_exchange_antimatter_block.png",
		"equivalent_exchange_antimatter_block.png",
		"equivalent_exchange_antimatter_block.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	emc = 4202496
})

minetest.register_node("equivalent_exchange:condensed_antimatter", {
	description = "Condensed Antimatter",
	tiles = {
		"equivalent_exchange_condensed_antimatter.png",
		"equivalent_exchange_condensed_antimatter.png",
		"equivalent_exchange_condensed_antimatter.png",
		"equivalent_exchange_condensed_antimatter.png",
		"equivalent_exchange_condensed_antimatter.png",
		"equivalent_exchange_condensed_antimatter.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 5},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	emc = 33628160
})

-- Registering Craft Items --

minetest.register_craftitem("equivalent_exchange:alchemical_crystal", {
	description = "Alchemical Crystal",
	inventory_image = "equivalent_exchange_alchemical_crystal.png",
	emc = 512,
})

minetest.register_craftitem("equivalent_exchange:mobius_fuel", {
	description = "Mobius Fuel",
	inventory_image = "equivalent_exchange_mobius_fuel.png",
	emc = 2048,
})

minetest.register_craftitem("equivalent_exchange:aeternalis_fuel", {
	description = "Aeternalis Fuel",
	inventory_image = "equivalent_exchange_aeternalis_fuel.png",
	emc = 8192,
})

minetest.register_craftitem("equivalent_exchange:red_matter", {
	description = "Red Matter",
	inventory_image = "equivalent_exchange_red_matter.png",
	emc = 139264
})

minetest.register_craftitem("equivalent_exchange:antimatter", {
	description = "Antimatter",
	inventory_image = "equivalent_exchange_antimatter.png",
	emc = 466944
})

-- Registering Crafts --

local fuels = {"default:diamond","equivalent_exchange:alchemical_crystal","equivalent_exchange:mobius_fuel","equivalent_exchange:aeternalis_fuel"}

for i = 2,4 do
	minetest["register_craft"]({
		type = "shapeless",
		output = fuels[i],
		recipe = {"equivalent_exchange:philosophers_stone", fuels[i-1], fuels[i-1], fuels[i-1],fuels[i-1]},
		replacements = {
			{"equivalent_exchange:philosophers_stone", "equivalent_exchange:philosophers_stone"}
		}
	})
	minetest["register_craft"]({
		type = "shapeless",
		output = fuels[i-1].." 4",
		recipe = {"equivalent_exchange:philosophers_stone", fuels[i]},
		replacements = {
			{"equivalent_exchange:philosophers_stone", "equivalent_exchange:philosophers_stone"}
		}
	})
end

minetest.register_craft({
	output = "equivalent_exchange:red_matter",
	recipe = {
		{"equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel"},
		{"equivalent_exchange:aeternalis_fuel", "default:mese", "equivalent_exchange:aeternalis_fuel"},
		{"equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:antimatter",
	recipe = {
		{"equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel"},
		{"equivalent_exchange:red_matter","equivalent_exchange:red_matter","equivalent_exchange:red_matter"},
		{"equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel", "equivalent_exchange:aeternalis_fuel"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:red_matter_block",
	recipe = {
		{"equivalent_exchange:red_matter", "equivalent_exchange:red_matter", "equivalent_exchange:red_matter"},
		{"equivalent_exchange:red_matter", "equivalent_exchange:red_matter", "equivalent_exchange:red_matter"},
		{"equivalent_exchange:red_matter", "equivalent_exchange:red_matter", "equivalent_exchange:red_matter"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:antimatter_block",
	recipe = {
		{"equivalent_exchange:antimatter", "equivalent_exchange:antimatter", "equivalent_exchange:antimatter"},
		{"equivalent_exchange:antimatter", "equivalent_exchange:antimatter", "equivalent_exchange:antimatter"},
		{"equivalent_exchange:antimatter", "equivalent_exchange:antimatter", "equivalent_exchange:antimatter"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:condensed_antimatter",
	recipe = {
		{"equivalent_exchange:antimatter_block", "equivalent_exchange:antimatter_block", "equivalent_exchange:antimatter_block"},
		{"equivalent_exchange:antimatter_block", "equivalent_exchange:aeternalis_fuel", "equivalent_exchange:antimatter_block"},
		{"equivalent_exchange:antimatter_block", "equivalent_exchange:antimatter_block", "equivalent_exchange:antimatter_block"}
	}
})