local emcs = {
	["default"] = {
	-- Plains --
		dirt = 1,
		grass_1 = 5,
		sand = 1,
		papyrus = 50,
		clay = 160,
		clay_lump = 40,
		tree = 16,
		leaves = 5,
		apple = 128,
		sapling = 16,
	-- Tundra --
		snow = 1,
		ice = 10,
		pinetree = 16,
		pine_sapling = 16,
	-- Desert --
		desert_cobble = 1,
		desert_sand = 1,
		cactus = 30, 
		dry_shrub = 5,
	-- Jungle --
		jungletree = 16,
		jungleleaves = 5,
		junglegrass = 5,
		junglesapling = 16,
	-- Underground--
		cobble = 1,
		mossycobble = 110,
		gravel = 55,
		coal_lump = 55,
		-- Precise Value: 57
		iron_lump = 61,
		-- Precise Value (of lump): 61
		copper_lump = 146,
		-- Precise Value (of lump): 442
		gold_lump = 488,
		-- Precise Value: 420
		mese_crystal = 425,
		-- Precise Value: 848
		diamond = 976,
		obsidian = 
		nyancat = 3786750,
		nyancat_rainbow = 3786750,
	-- Exceptions --
		wood = 4,
		junglewood = 4,
		pinewood = 4,
		stick = 1,
	},
	["bucket"] = {
		bucket_water = 275, 
		bucket_lava = 
	},
	["farming"] = {
		seed_wheat = 20,
		seed_cotton = 35,
		wheat = 50,
		flour = 200,
		bread = 300,
		string = 86,
	},
	["flowers"] = {
		dandelion_white = 5,
		dandelion_yellow = 5,
		geranium = 5,
		rose = 5,
		tulip = 5,
		viola = 5,
	},
}

for modname, itemlist in pairs(emcs) do
	for itemname, emcvalue in pairs(itemlist) do
		minetest.override_item(modname..":"..itemname, {
			description = minetest.registered_items[modname..":"..itemname].description.."\nEMC Value: "..emcvalue,
		    emc = emcvalue,
		})
	end
end