dofile(minetest.get_modpath("equivalent_exchange").."/emcs.lua")

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
		return "size[8,10]"..
				"list[current_name;to;1,0;1,1;]"..
				"list[current_name;from;0,1.5;8,4;]"..
				"list[current_player;main;0,6;8,4;]"..
				"image[4,0;1,1;default_furnace_fire_bg.png^[lowpart:"..
				(emc/target*100)..":default_furnace_fire_fg.png]"
	end,
}

minetest.register_craftitem("equivalent_exchange:book_of_power_1", {
	description = "Book Of Power 1",
	inventory_image = "default_book.png",
	emc = 1200,
})

minetest.register_node("equivalent_exchange:condenser", {
	description = "Energy Condenser",
	tiles = {
		"default_chest_top.png^equivalent_exchange_magic.png",
		"default_chest_top.png^equivalent_exchange_magic.png",
		"default_chest_side.png^equivalent_exchange_magic.png",
		"default_chest_side.png^equivalent_exchange_magic.png",
		"default_chest_side.png^equivalent_exchange_magic.png",
		"default_chest_front.png^equivalent_exchange_magic.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
		meta:set_string("formspec", equivalent_exchange.get_formspec(0, 0))
		meta:set_string("infotext", "Energy Condenser")
		local inv = meta:get_inventory()
		inv:set_size("to", 1)
		inv:set_size("from", 8*4)
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
	emc = 500
})