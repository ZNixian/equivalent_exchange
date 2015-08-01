local colors = {'grey','dark_grey','black','blue','cyan','green','dark_green','yellow','orange','brown','red','pink','magenta','violet'}

minetest.register_craftitem("equivalent_exchange:alchemy_bag_white", {
	description = "White Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_white.png",
	emc = 9631,
})

minetest.register_craft({
	output = "equivalent_exchange:equivalent_exchange:alchemy_bag",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:white", "equivalent_exchange:alchemical_chest", "wool:white"},
		{"wool:white", "wool:white", "wool:white"}
	}
})

for i = 1,14 do

	-- Registering Craft Items --

	minetest["register_craftitem"](":".."equivalent_exchange:alchemy_bag_"..colors[i], {
		description = colors[i]:gsub("^%l", string.upper).." Alchemy Bag",
		groups = {not_in_creative_inventory = 1},
		inventory_image = "equivalent_exchange_alchemy_bag_"..colors[i]..".png",
		emc = 9631,
	})

	-- Registering Crafts --

	minetest["register_craft"]({
		output = "equivalent_exchange:alchemy_bag_"..colors[i],
		recipe = {
			{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
			{"wool:"..colors[i], "equivalent_exchange:alchemical_chest", "wool:"..colors[i]},
			{"wool:"..colors[i], "wool:"..colors[i], "wool:"..colors[i]}
		}
	})

	minetest["register_craft"]({
		type = "shapeless",
		output = "equivalent_exchange:alchemy_bag_"..colors[i],
		recipe = {"equivalent_exchange:alchemy_bag_white", "dye:"..colors[i]}
	})

end