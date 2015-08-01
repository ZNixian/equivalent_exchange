condenser = {	
	convert = function(pos)
		local meta = minetest.get_meta(pos)
		local inventory = meta:get_inventory()
		local target = inventory:get_stack("to", 1)
		local emc = meta:get_int("emc")
		if target:is_empty() then 
			 meta:set_string("formspec", condenser.get_formspec(emc, 0))
			 return
		end
		if not inventory:room_for_item("from", target:get_name()) then return end
		target = target:to_table()
		local target_emc = condenser.get_emc(target.name)
		if not target_emc then return end
		local emc = meta:get_int("emc")
		local size = inventory:get_size("from")
		for i=1, size do
			local stack = inventory:get_stack("from", i)
			if not stack:is_empty() then
				stack = stack:to_table()
				local local_emc = condenser.get_emc(stack.name)
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
		meta:set_string("formspec", condenser.get_formspec(emc, target_emc))
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
-- Registering ABMs --

minetest.register_abm({
	nodenames = {"equivalent_exchange:condenser"},
	interval = 1.5,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		condenser.convert(pos)
	end,
})
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
		meta:set_string("formspec", condenser.get_formspec(0, 0))
		meta:set_string("infotext", "Energy Condenser")
		meta:set_string("emc_storable", "true")
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
		condenser.convert(pos)
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		condenser.convert(pos)
		return count
	end,
	emc = 42,011
})

--Registering Crafts--

minetest.register_craft({
	output = "equivalent_exchange:condenser",
	recipe = {
		{"default:obsidian", "default:mese", "default:obsidian"},
		{"default:mese", "equivalent_exchange:alchemical_chest", "default:mese"},
		{"default:obsidian", "default:mese", "default:obsidian"}
	}
})