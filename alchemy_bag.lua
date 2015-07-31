-- Registering Craft Items --

minetest.register_craftitem("equivalent_exchange:alchemy_bag_white", {
	description = "White Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_white.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_grey", {
	description = "Grey Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_grey.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_dark_grey", {
	description = "Dark Grey Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_dark_grey.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_black", {
	description = "Black Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_black.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_blue", {
	description = "Blue Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_blue.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_cyan", {
	description = "Cyan Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_cyan.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_green", {
	description = "Green Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_green.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_dark_green", {
	description = "Dark Green Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_dark_green.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_yellow", {
	description = "Yellow Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_yellow.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_orange", {
	description = "Orange Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_orange.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_brown", {
	description = "Brown Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_brown.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_red", {
	description = "Red Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_red.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_pink", {
	description = "Pink Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_pink.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_magenta", {
	description = "Magenta Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_magenta.png",
	emc = 9631,
})

minetest.register_craftitem("equivalent_exchange:alchemy_bag_violet", {
	description = "alchemy_bag_violet Alchemy Bag",
	inventory_image = "equivalent_exchange_alchemy_bag_violet.png",
	emc = 9631,
})

-- Registering Crafts --

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_white",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:white", "equivalent_exchange:alchemical_chest", "wool:white"},
		{"wool:white", "wool:white", "wool:white"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_grey",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:grey", "equivalent_exchange:alchemical_chest", "wool:grey"},
		{"wool:grey", "wool:grey", "wool:grey"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_dark_grey",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:dark_grey", "equivalent_exchange:alchemical_chest", "wool:dark_grey"},
		{"wool:dark_grey", "wool:dark_grey", "wool:dark_grey"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_black",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:black", "equivalent_exchange:alchemical_chest", "wool:black"},
		{"wool:black", "wool:black", "wool:black"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_blue",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:blue", "equivalent_exchange:alchemical_chest", "wool:blue"},
		{"wool:blue", "wool:blue", "wool:blue"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_cyan",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:cyan", "equivalent_exchange:alchemical_chest", "wool:cyan"},
		{"wool:cyan", "wool:cyan", "wool:cyan"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_green",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:green", "equivalent_exchange:alchemical_chest", "wool:green"},
		{"wool:green", "wool:green", "wool:green"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_dark_green",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:dark_green", "equivalent_exchange:alchemical_chest", "wool:dark_green"},
		{"wool:dark_green", "wool:dark_green", "wool:dark_green"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_yellow",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:yellow", "equivalent_exchange:alchemical_chest", "wool:yellow"},
		{"wool:yellow", "wool:yellow", "wool:yellow"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_orange",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:orange", "equivalent_exchange:alchemical_chest", "wool:orange"},
		{"wool:orange", "wool:orange", "wool:orange"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_brown",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:brown", "equivalent_exchange:alchemical_chest", "wool:brown"},
		{"wool:brown", "wool:brown", "wool:brown"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_red",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:red", "equivalent_exchange:alchemical_chest", "wool:red"},
		{"wool:red", "wool:red", "wool:red"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_pink",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:pink", "equivalent_exchange:alchemical_chest", "wool:pink"},
		{"wool:pink", "wool:pink", "wool:pink"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_magenta",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:magenta", "equivalent_exchange:alchemical_chest", "wool:magenta"},
		{"wool:magenta", "wool:magenta", "wool:magenta"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:alchemy_bag_violet",
	recipe = {
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"},
		{"wool:violet", "equivalent_exchange:alchemical_chest", "wool:violet"},
		{"wool:violet", "wool:violet", "wool:violet"}
	}
})