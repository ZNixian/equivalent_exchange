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

minetest.register_craft({
	type = "shapeless",
	output = "equivalent_exchange:low_covalence 40",
	recipe = {"default:cobble", "default:cobble", "default:cobble",
		"default:cobble", "default:cobble", "default:cobble",
		"default:cobble", "default:cobble", "default:coal_lump"}
})

minetest.register_craft({
	type = "shapeless",
	output = "equivalent_exchange:medium_covalence 40",
	recipe = {"default:steel_ingot", "default:bronze_ingot"}
})

minetest.register_craft({
	type = "shapeless",
	output = "equivalent_exchange:high_covalence 40",
	recipe = {"default:diamond", "default:mese_crystal"}
})

local materials = {"wood","stone","steel","bronze","mese","diamond"}
local covalence = {"low_covalence","low_covalence","medium_covalence","medium_covalence","high_covalence","high_covalence"}
local tools = {"pick_","shovel_","axe_","sword_","hoe_"}
local type = {"default:","default:","default:","default:","farming:"}


for i = 1,6 do
	for j = 1,5 do
		minetest["register_craft"]({
			type = "shapeless",
			output = type[j]..tools[j]..materials[i],
			recipe = {"equivalent_exchange:"..covalence[i], "equivalent_exchange:"..covalence[i], "equivalent_exchange:"..covalence[i], type[j]..tools[j]..materials[i]}
		})
	end
end

minetest.register_craft({
	type = "shapeless",
	output = "screwdriver:screwdriver",
	recipe = {"equivalent_exchange:medium_covalence", "equivalent_exchange:medium_covalence", "equivalent_exchange:medium_covalence", "screwdriver:screwdriver"}
})

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