local emcs = {
	node = {
		["default:"] = {
			stone = 2,
			cobble = 1,
			desert_stone = 1,
			stonebrick = 1,
			desert_stonebrick = 1,
			dirt_with_grass = 50,
			dirt_with_snow = 50,
			dirt = 1,
			sand=1,
			desert_sand = 1,
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

			-- Old Value: 128
			-- Precise Value: 57
			coal_lump = 55,

			-- Old Value: 8442
			-- Precise Value: 420 (including blocks)
			mese_crystal = 425,

			-- Old Value: 8192
			-- Precise Value: 848
			diamond = 850,
			clay_lump = 16,

			-- Old Value: 256
			-- Precise Value (of lump): 61
			steel_ingot = 90,

			-- Old Value: 85
			-- Precise Value (of lump): 146
			copper_ingot = 225,

			--Old Value: 255
			bronze_ingot = 90 + 225,

			-- Old Value: 2048
			-- Precise Value (of lump): 442
			gold_ingot = 675,

			-- Old Value: 938
			-- Precise Value: 47
			mese_crystal_fragment = 25,
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
			minetest["register_"..type](":"..prefix..name, node)
		end
	end
end