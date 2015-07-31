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
