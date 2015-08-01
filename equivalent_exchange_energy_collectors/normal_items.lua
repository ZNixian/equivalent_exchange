local modname = "equivalent_exchange_energy_collectors:"

-- Registering Nodes --

minetest.register_node(modname.."red_matter_block", {
	description = "Red Matter Block",
	tiles = {
		"ee_energy_collectors_red_matter_block.png",
		"ee_energy_collectors_red_matter_block.png",
		"ee_energy_collectors_red_matter_block.png",
		"ee_energy_collectors_red_matter_block.png",
		"ee_energy_collectors_red_matter_block.png",
		"ee_energy_collectors_red_matter_block.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	emc = 1253376
})

minetest.register_node(modname.."antimatter_block", {
	description = "Antimatter Block",
	tiles = {
		"ee_energy_collectors_antimatter_block.png",
		"ee_energy_collectors_antimatter_block.png",
		"ee_energy_collectors_antimatter_block.png",
		"ee_energy_collectors_antimatter_block.png",
		"ee_energy_collectors_antimatter_block.png",
		"ee_energy_collectors_antimatter_block.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 3},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	emc = 4202496
})

minetest.register_node(modname.."condensed_antimatter", {
	description = "Condensed Antimatter",
	tiles = {
		"ee_energy_collectors_condensed_antimatter.png",
		"ee_energy_collectors_condensed_antimatter.png",
		"ee_energy_collectors_condensed_antimatter.png",
		"ee_energy_collectors_condensed_antimatter.png",
		"ee_energy_collectors_condensed_antimatter.png",
		"ee_energy_collectors_condensed_antimatter.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 5},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	emc = 33628160
})

-- Registering Craft Items --

minetest.register_craftitem(modname.."alchemical_crystal", {
	description = "Alchemical Crystal",
	inventory_image = "ee_energy_collectors_alchemical_crystal.png",
	emc = 512,
})

minetest.register_craftitem(modname.."mobius_fuel", {
	description = "Mobius Fuel",
	inventory_image = "ee_energy_collectors_mobius_fuel.png",
	emc = 2048,
})

minetest.register_craftitem(modname.."aeternalis_fuel", {
	description = "Aeternalis Fuel",
	inventory_image = "ee_energy_collectors_aeternalis_fuel.png",
	emc = 8192,
})

minetest.register_craftitem(modname.."red_matter", {
	description = "Red Matter",
	inventory_image = "ee_energy_collectors_red_matter.png",
	emc = 139264
})

minetest.register_craftitem(modname.."antimatter", {
	description = "Antimatter",
	inventory_image = "ee_energy_collectors_antimatter.png",
	emc = 466944
})

-- Registering Crafts --

local fuels = {"default:diamond",modname.."alchemical_crystal",modname.."mobius_fuel",modname.."aeternalis_fuel"}

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
	output = modname.."red_matter",
	recipe = {
		{modname.."aeternalis_fuel", modname.."aeternalis_fuel", modname.."aeternalis_fuel"},
		{modname.."aeternalis_fuel", "default:mese", modname.."aeternalis_fuel"},
		{modname.."aeternalis_fuel", modname.."aeternalis_fuel", modname.."aeternalis_fuel"}
	}
})

minetest.register_craft({
	output = modname.."antimatter",
	recipe = {
		{modname.."aeternalis_fuel", modname.."aeternalis_fuel", modname.."aeternalis_fuel"},
		{modname.."red_matter",modname.."red_matter",modname.."red_matter"},
		{modname.."aeternalis_fuel", modname.."aeternalis_fuel", modname.."aeternalis_fuel"}
	}
})

minetest.register_craft({
	output = modname.."red_matter_block",
	recipe = {
		{modname.."red_matter", modname.."red_matter", modname.."red_matter"},
		{modname.."red_matter", modname.."red_matter", modname.."red_matter"},
		{modname.."red_matter", modname.."red_matter", modname.."red_matter"}
	}
})

minetest.register_craft({
	output = modname.."antimatter_block",
	recipe = {
		{modname.."antimatter", modname.."antimatter", modname.."antimatter"},
		{modname.."antimatter", modname.."antimatter", modname.."antimatter"},
		{modname.."antimatter", modname.."antimatter", modname.."antimatter"}
	}
})

minetest.register_craft({
	output = modname.."condensed_antimatter",
	recipe = {
		{modname.."antimatter_block", modname.."antimatter_block", modname.."antimatter_block"},
		{modname.."antimatter_block", modname.."aeternalis_fuel", modname.."antimatter_block"},
		{modname.."antimatter_block", modname.."antimatter_block", modname.."antimatter_block"}
	}
})