local emcs = {
	node = {
		["default:"] = {
			["stone"] = 1,
			["cobble"] = 1,
			["desert_stone"] = 1,
			["stonebrick"] = 1,
			["desert_stonebrick"] = 1,
			["dirt_with_grass"] = 1,
			["dirt_with_snow"] = 1,
			dirt = 1,
			sand=1,
			["desert_sand"] = 1,
			gravel = 4,
			sandstone = 4,
			sandstonebrick = 4,
			clay = 16,
			brick = 16,
			tree = 32,
			jungletree = 32,
			junglewood = 8,
			cactus = 8,
			papyrus = 32,
			bookshelf = 336,
			glass = 1,
			fence_wood = 12,
			rail = 96,
			ladder = 14,
			wood = 8,
			torch = 9,
			sign_wall = 52,
			chest = 64,
			chest_locked = 320,
			furnace = 8,
			mossycobble = 1,
			mese=75978,
			obsidian = 64,
		}
	},
	craftitem = {
		["default:"] = {
			stick = 2,
			paper = 96,
			book = 288,
			coal_lump = 128,
			mese_crystal = 8442,
			diamond = 8192,
			clay_lump = 16,
			steel_ingot = 256,
			copper_ingot = 85,
			bronze_ingot = 255,
			gold_ingot = 2048,
			mese_crystal_fragment = 938,
			clay_brick = 16,
		}
	}
--	block = {
--		["default:"] = {
--		}
--	}
}

for type, emcset in pairs(emcs) do
	for prefix, subs in pairs(emcset) do
		for name, emc in pairs(subs) do
			local ornode = minetest.registered_items[prefix..name]
			local node = {emc=emc}
			for tagname, tagvalue in pairs(ornode) do
				node[tagname] = tagvalue
			end
			print(name.."="..emc.."="..dump(node.emc))
			minetest["register_"..type](":"..prefix..name, node)
		end
	end
end