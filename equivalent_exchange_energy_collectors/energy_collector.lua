local modname = "equivalent_exchange_energy_collectors:"

collector = {
	emc_gather = function(orig_emc, mark, multiplier)
		return orig_emc + (10^(mark - 1)) * multiplier
	end,
	emc_transfer = function(mark,pos,multiplier)
		local meta = minetest.get_meta(pos)
		local emc = meta:get_int("emc")
		local surrounding_nodes = {
			minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z}),
			minetest.get_meta({x = pos.x - 1,  y = pos.y, z = pos.z}),
			minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}),
			minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}),
			minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1}),
			minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1})
		}
		local emc_transferable_nodes = {}
		local emc_transferable_nodes_length = 0
		for i = 1,6 do
			if surrounding_nodes[i]:get_string("emc_storable") == "true" then
				table.insert(emc_transferable_nodes,surrounding_nodes[i])
				emc_transferable_nodes_length = emc_transferable_nodes_length + 1
			end
		end
		if emc_transferable_nodes_length == 0 then
			local generate_amount = math.floor(emc / 10)
			local timesOver = math.floor(generate_amount / 99)
			local inventory = meta:get_inventory()
			local size = inventory:get_size("container")
			if emc >= 10 then
				meta:set_int("emc", emc - 10*generate_amount)
				if mark == 4 then
					meta:set_string("formspec",
						"size[8,7.5]"..
						"label[0,0;Antimatter Collector]"..
						"label[4,0;EMC Stored: "..emc - 10*generate_amount.."]"..
						"list[current_name;container;0,0.5;8,7;]")
				else
					meta:set_string("formspec",
						"size[8,7.5]"..
						"label[0,0;Energy Collector Mark "..mark.."]"..
						"label[4,0;EMC Stored: "..emc - 10*generate_amount.."]"..
						"list[current_name;container;0,0.5;8,7;]")
				end
				for i = 1, timesOver do
  					inventory:add_item("container", {name = modname.."klein_star", count = 99})
  				end
  				if timesOver % 99 > 0 then
   					inventory:add_item("container", {name = modname.."klein_star", count = timesOver % 99})
  				end
			end
		end
		local newemc = (collector.emc_gather(emc, mark, multiplier))
		local distribution = math.floor(newemc / emc_transferable_nodes_length)
		for j = 1,emc_transferable_nodes_length do
			print(mark)
			if mark == 4 then
				meta:set_string("formspec",
					"size[8,7.5]"..
					"label[0,0;Antimatter Collector]"..
					"label[4,0;EMC Stored: "..(newemc - distribution).."]"..
					"list[current_name;container;0,0.5;8,7;]")
			else
				meta:set_string("formspec",
					"size[8,7.5]"..
					"label[0,0;Energy Collector Mark "..mark.."]"..
					"label[4,0;EMC Stored: "..(newemc - distribution).."]"..
					"list[current_name;container;0,0.5;8,7;]")
			end
			meta:set_int("emc",(newemc - distribution))
			emc_transferable_nodes[j]:set_int("emc", (emc_transferable_nodes[j]:get_int("emc") + distribution))
		end
	end,
	check_multiplier = function(pos)
		local multiplier = 1
		if minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}):get_int("multiplier") == 2 then
			multiplier = 2
		end
		return multiplier
	end,
}

-- Registering ABMs --

minetest.register_abm({
	nodenames = {modname.."mk1"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)	
		local meta = minetest.get_meta(pos)
		local emc = meta:get_int("emc")
		local multiplier = collector.check_multiplier(pos)
		meta:set_string("formspec",
			"size[8,7.5]"..
			"label[0,0;Energy Collector Mark 1]"..
			"label[4,0;EMC Stored: "..collector.emc_gather(emc,1,multiplier).."]"..
			"list[current_name;container;0,0.5;8,7;]")
		meta:set_int("emc",collector.emc_gather(emc,1,multiplier))
		collector.emc_transfer(1,pos,multiplier)
	end,
})

minetest.register_abm({
	nodenames = {modname.."mk2"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)	
		local meta = minetest.get_meta(pos)
		local emc = meta:get_int("emc")
		local multiplier = collector.check_multiplier(pos)
		meta:set_string("formspec",
			"size[8,7.5]"..
			"label[0,0;Energy Collector Mark 2]"..
			"label[4,0;EMC Stored: "..collector.emc_gather(emc,2,multiplier).."]"..
			"list[current_name;container;0,0.5;8,7;]")
		meta:set_int("emc",collector.emc_gather(emc,2,multiplier))
		collector.emc_transfer(2,pos,multiplier)
	end,
})

minetest.register_abm({
	nodenames = {modname.."mk3"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)	
		local meta = minetest.get_meta(pos)
		local emc = meta:get_int("emc")
		local multiplier = collector.check_multiplier(pos)
		meta:set_string("formspec",
			"size[8,7.5]"..
			"label[0,0;Energy Collector Mark 3]"..
			"label[4,0;EMC Stored: "..collector.emc_gather(emc,3,multiplier).."]"..
			"list[current_name;container;0,0.5;8,7;]")
		meta:set_int("emc",collector.emc_gather(emc,3,multiplier))
		collector.emc_transfer(3,pos,multiplier)
	end,
})

minetest.register_abm({
	nodenames = {modname.."antimatter_collector"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)	
		local meta = minetest.get_meta(pos)
		local emc = meta:get_int("emc")
		local multiplier = collector.check_multiplier(pos)
		meta:set_string("formspec",
			"size[8,7.5]"..
			"label[0,0;Antimatter Collector]"..
			"label[4,0;EMC Stored: "..collector.emc_gather(emc,4,multiplier).."]"..
			"list[current_name;container;0,0.5;8,7;]")
		meta:set_int("emc",collector.emc_gather(emc,4,multiplier))
		collector.emc_transfer(4,pos,multiplier)
	end,
})

-- Registering Nodes --

minetest.register_node(modname.."mk1", {
	description = "Energy Collector Mark 1",
	tiles = {
		"ee_energy_collectors_energy_collector_mk1_top.png",
		"ee_energy_collectors_energy_collector_mk1_bottom.png",
		"ee_energy_collectors_energy_collector_mk1_side.png",
		"ee_energy_collectors_energy_collector_mk1_side.png",
		"ee_energy_collectors_energy_collector_mk1_side.png",
		"ee_energy_collectors_energy_collector_mk1_side.png",
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec",
		"size[8,7.5]"..
		"label[0,0;Energy Collector Mark 1]"..
		"label[4,0;EMC Stored: 0]"..
		"list[current_name;container;0,0.5;8,7;]")
	meta:set_string("infotext", "Energy Collector Mark 1")
	meta:set_int("emc", 0)
	local inv = meta:get_inventory()
	inv:set_size("container", 8*7)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("container")
	end,
	emc = 529605
})

minetest.register_node(modname.."mk2", {
	description = "Energy Collector Mark 2",
	tiles = {
		"ee_energy_collectors_energy_collector_mk2_top.png",
		"ee_energy_collectors_energy_collector_mk2_bottom.png",
		"ee_energy_collectors_energy_collector_mk2_side.png",
		"ee_energy_collectors_energy_collector_mk2_side.png",
		"ee_energy_collectors_energy_collector_mk2_side.png",
		"ee_energy_collectors_energy_collector_mk2_side.png",
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec",
		"size[8,7.5]"..
		"label[0,0;Energy Collector Mark 2]"..
		"label[4,0;EMC Stored: 0]"..
		"list[current_name;container;0,0.5;8,7;]")
	meta:set_string("infotext", "Energy Collector Mark 2")
	meta:set_int("emc", 0)
	local inv = meta:get_inventory()
	inv:set_size("container", 8*7)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("container")
	end,
	emc = 529605
})

minetest.register_node(modname.."mk3", {
	description = "Energy Collector Mark 3",
	tiles = {
		"ee_energy_collectors_energy_collector_mk3_top.png",
		"ee_energy_collectors_energy_collector_mk3_bottom.png",
		"ee_energy_collectors_energy_collector_mk3_side.png",
		"ee_energy_collectors_energy_collector_mk3_side.png",
		"ee_energy_collectors_energy_collector_mk3_side.png",
		"ee_energy_collectors_energy_collector_mk3_side.png",
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec",
		"size[8,7.5]"..
		"label[0,0;Energy Collector Mark 3]"..
		"label[4,0;EMC Stored: 0]"..
		"list[current_name;container;0,0.5;8,7;]")
	meta:set_string("infotext", "Energy Collector Mark 3")
	meta:set_int("emc", 0)
	local inv = meta:get_inventory()
	inv:set_size("container", 8*7)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("container")
	end,
	emc = 529605
})

minetest.register_node(modname.."antimatter_collector", {
	description = "Antimatter Collector",
	tiles = {
		"ee_energy_collectors_antimatter_collector_top.png",
		"ee_energy_collectors_antimatter_collector_bottom.png",
		"ee_energy_collectors_antimatter_collector_side.png",
		"ee_energy_collectors_antimatter_collector_side.png",
		"ee_energy_collectors_antimatter_collector_side.png",
		"ee_energy_collectors_antimatter_collector_side.png",
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec",
		"size[8,7.5]"..
		"label[0,0;Antimatter Collector]"..
		"label[4,0;EMC Stored: 0]"..
		"list[current_name;container;0,0.5;8,7;]")
	meta:set_string("infotext", "Antimatter Collector")
	meta:set_int("emc", 0)
	local inv = meta:get_inventory()
	inv:set_size("container", 8*7)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("container")
	end,
	emc = 269554885
})

minetest.register_node(modname.."interdiction_stone", {
	description = "Interdiction Stone",
	tiles = {
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	light_source = 10,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("multiplier", 2)
	end,
})

-- Registering Craft Items --

minetest.register_craftitem(modname.."klein_star", {
	description = "Klein Star",
	inventory_image = "ee_energy_collectors_klein_star.png",
	emc = 100, 
})

-- Registering Crafts --

minetest.register_craft({
	output = modname.."mk1",
	recipe = {
		{"default:mese", "default:glass", "default:mese"},
		{"default:mese", "default:diamondblock", "default:mese"},
		{"default:mese", "default:furnace", "default:mese"}
	}
})

minetest.register_craft({
	output = modname.."mk2",
	recipe = {
		{"default:mese", modname.."red_matter", "default:mese"},
		{"default:mese", modname.."mk1", "default:mese"},
		{"default:mese", "default:mese", "default:mese"}
	}
})

minetest.register_craft({
	output = modname.."mk3",
	recipe = {
		{"default:mese", modname.."antimatter", "default:mese"},
		{"default:mese", modname.."mk2", "default:mese"},
		{"default:mese", "default:mese", "default:mese"}
	}
})

minetest.register_craft({
	output = modname.."interdiction_stone",
	recipe = {
		{"default:torch", modname.."aeternalis_fuel", "default:torch"},
		{modname.."aeternalis_fuel", "equivalent_exchange:philosophers_stone", modname.."aeternalis_fuel"},
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"}
	},
	replacements = {
		{"equivalent_exchange:philosophers_stone", "equivalent_exchange:philosophers_stone"}
	}
})

minetest.register_craft({
	output = modname.."antimatter_collector",
	recipe = {
		{modname.."condensed_antimatter", modname.."condensed_antimatter", modname.."condensed_antimatter"},
		{modname.."condensed_antimatter", modname.."mk3", modname.."condensed_antimatter"},
		{modname.."condensed_antimatter", modname.."condensed_antimatter", modname.."condensed_antimatter"}
	}
})
