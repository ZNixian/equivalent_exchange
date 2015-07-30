
emc_gather = function(orig_emc, type)
	return orig_emc + (10^(type - 1))
end,

-- Registering ABMs --
minetest.register_abm({
	nodenames = {"equivalent_exchange:energy_collector_mk1"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)	
		local meta = minetest.get_meta(pos)
			local emc = meta:get_int("emc")
			meta:set_string("formspec",
				"size[6,1.5]"..
				"label[0,0;Energy Collector Mark 1]"..
				"label[4,0;EMC Stored: "..emc_gather(emc,1).."]"..
				"list[current_name;container;0,0.5;6,1;]")
			meta:set_int("emc",emc_gather(emc,1))
	end,
})

-- Registering Nodes --

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
			"label[4,0;EMC Stored: 0]"..
			"list[current_name;container;0,0.5;6,1;]")
		meta:set_string("infotext", "Energy Collector Mark 1")
		meta:set_int("emc", 0)
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

-- Registering Crafts --
minetest.register_craft({
	output = "equivalent_exchange:energy_collector_mk1",
	recipe = {
		{"default:mese", "default:glass", "default:mese"},
		{"default:mese", "default:diamondblock", "default:mese"},
		{"default:mese", "default:furnace", "default:mese"}
	}
})