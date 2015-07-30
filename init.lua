dofile(minetest.get_modpath("equivalent_exchange").."/emcs.lua")

if minetest.get_modpath("buildtest")~=nil then
	buildtest.canPumpInto["equivalent_exchange:condenser"] = {
		"from",
		on_send = function(pos)
			equivalent_exchange.convert(pos)
		end	
	}
	buildtest.pumps.pulls["equivalent_exchange:condenser"] = {"from"}
end

equivalent_exchange = {
	convert = function(pos)
		local meta = minetest.get_meta(pos)
		local inventory = meta:get_inventory()
		local target = inventory:get_stack("to", 1)
		if target:is_empty() then return end
		if not inventory:room_for_item("from", target:get_name()) then return end
		target = target:to_table()
		local target_emc = equivalent_exchange.get_emc(target.name)
		if not target_emc then return end
		local emc = meta:get_int("emc")
		local size = inventory:get_size("from")
		for i=1, size do
			local stack = inventory:get_stack("from", i)
			if not stack:is_empty() then
				stack = stack:to_table()
				local local_emc = equivalent_exchange.get_emc(stack.name)
				if local_emc ~= nil then
					emc = emc + local_emc * stack.count
					inventory:set_stack("from", i, {})
				end
				--print(dump(stack))
			end
		end
		local timesOver = math.floor(emc / target_emc)
		emc = emc - timesOver * target_emc
		meta:set_int("emc", emc)
		inventory:add_item("from", {name=target.name, count = timesOver})
		meta:set_string("formspec", equivalent_exchange.get_formspec(emc, target_emc))
	end,
	get_emc = function(name)
		return minetest.registered_items[name].emc
	end,
	get_formspec = function(emc, target)
		return "size[13,13]"..
				"label[0,0;Energy Condenser]"..
				"list[current_name;to;0,0.5;1,1;]"..
				"list[current_name;from;0,1.5;13,7;]"..
				"list[current_player;main;2.5,9;8,4;]"..
				"image[5,0;1,1;default_furnace_fire_bg.png^[lowpart:"..
				(emc/target*100)..":default_furnace_fire_fg.png]"..
				"label[10.5,0.5;Current EMC: ".. emc .."\nNeeded EMC: ".. (target - emc).."]"		
	end,
}

-- Registering Nodes --

minetest.register_node("equivalent_exchange:condenser", {
	description = "Energy Condenser",
	tiles = {
		"equivalent_exchange_condenser_top.png",
		"equivalent_exchange_condenser_bottom.png",
		"equivalent_exchange_condenser_side.png",
		"equivalent_exchange_condenser_side.png",
		"equivalent_exchange_condenser_side.png",
		"equivalent_exchange_condenser_side.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
		meta:set_string("formspec", equivalent_exchange.get_formspec(0, 0))
		meta:set_string("infotext", "Energy Condenser")
		local inv = meta:get_inventory()
		inv:set_size("to", 1)
		inv:set_size("from", 13*7)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("to") then
			return false
		elseif not inv:is_empty("from") then
			return false
		end
		return true
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		equivalent_exchange.convert(pos)
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		equivalent_exchange.convert(pos)
		return count
	end,
	emc = 42,011
})

minetest.register_node("equivalent_exchange:alchemical_chest", {
	description = "Alchemical Chest",
	tiles = {
		"equivalent_exchange_alchemical_chest_top.png",
		"equivalent_exchange_alchemical_chest_bottom.png",
		"equivalent_exchange_alchemical_chest_side.png",
		"equivalent_exchange_alchemical_chest_side.png",
		"equivalent_exchange_alchemical_chest_side.png",
		"equivalent_exchange_alchemical_chest_front.png",

	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[13,13]"..
			"label[0,0;Alchemical Chest]"..
			"list[current_name;container;0,0.5;13,8;]"..
			"list[current_player;main;2.5,9;8,4;]")
		meta:set_string("infotext", "Alchemical Chest")
		local inv = meta:get_inventory()
		inv:set_size("container", 13*8)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		return count
	end,
	emc = 8987
})

minetest.register_node("equivalent_exchange:energy_collector_mk1", {
	description = "Energy Collector Mark 1",
	--Texturing--
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[6,1.5]"..
			"label[0,0;Energy Collector Mark 1]"..
			"list[current_name;container;0,0.5;6,1;]")
		meta:set_string("infotext", "Energy Collector Mark 1")
		local inv = meta:get_inventory()
		inv:set_size("container", 6)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	emc = 529605
})

--Registering Craft Items--

minetest.register_craftitem("equivalent_exchange:book_of_power_1", {
	description = "Book Of Power 1",
	inventory_image = "default_book.png",
	emc = 1200,
})

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

--Registering Crafts--

minetest.register_craft({
	output = "equivalent_exchange:condenser",
	recipe = {
		{"default:obsidian", "default:diamond", "default:obsidian"},
		{"default:diamond", "equivalent_exchange:alchemical_chest", "default:diamond"},
		{"default:obsidian", "default:diamond", "default:obsidian"}
	}
})

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

minetest.register_craft({
	output = "equivalent_exchange:alchemical_chest",
	recipe = {
		{"equivalent_exchange:low_covalence", "equivalent_exchange:medium_covalence", "equivalent_exchange:high_covalence"},
		{"default:stone", "default:diamond", "default:stone"},
		{"default:steel_ingot", "default:chest", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "equivalent_exchange:energy_collector_mk1",
	recipe = {
		{"default:mese", "default:glass", "default:mese"},
		{"default:mese", "default:diamondblock", "default:mese"},
		{"default:mese", "default:furnace", "default:mese"}
	}
})

print("[equivalent_exchange] Mod loaded!")