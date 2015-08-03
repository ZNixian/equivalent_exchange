local emcs = {
	["default"] = {
	-- Plains --
		dirt = 1,
		grass_1 = 5,
		sand = 1,
		-- papyrus
		-- clay
		-- clay_lump	
		-- tree
		-- leaves
		-- apple
		-- sapling
	-- Tundra --
		snow = 1,
		-- ice 
		-- pinetree
		-- pinewood
		-- pine_sapling
	-- Desert --
		desert_cobble = 1,
		desert_sand = 1,
		-- cactus 
		dry_shrub = 5,
	-- Jungle --
		-- jungletree
		-- jungleleaves
		junglegrass = 5,
		-- junglesapling
	-- Underground--
		cobble = 1,
		-- mossycobble
		-- gravel
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
		-- obsidian
		-- nyancat
		-- nyancat_rainbow
	-- Exceptions --
		-- wood
		-- junglewood
		-- stick
	},
	-- ["bucket"] = {
	-- 	-- bucket_water
	-- 	-- bucket_lava
	-- },
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
minetest.override_item("wool:green", {
	description = "dlkasjfdslkfjlskadj"
	})

for modname, itemlist in pairs(emcs) do
	for itemname, emcvalue in pairs(itemlist) do
		minetest.override_item(modname..":"..itemname, {
			description = minetest.registered_items[modname..":"..itemname].description.."\nEMC Value: "..emcvalue,
		    emc = emcvalue,
		})
	end
end