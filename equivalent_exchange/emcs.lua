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

		-- REDO VALUE HERE
		obsidian = 0,

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

		-- REDO VALUE HERE
		bucket_lava = 0,
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
 
-- Add all items to a table.
local registered_items = {}
local local_emcs = {}
	 
for itemname, value in pairs(minetest.registered_items) do
      table.insert(registered_items, itemname)
end
 
-- Add EMC values to raw materials.
for modname, itemlist in pairs(emcs) do
        for itemname, emcvalue in pairs(itemlist) do
                minetest.override_item(modname..":"..itemname, {
                    description = minetest.registered_items[modname..":"..itemname].description.."\nEMC Value: "..emcvalue,
                    emc = emcvalue,
                })             
        end
end

for i=1,10 do
	for _, itemname in pairs(registered_items) do
		if itemname ~= ""
		  and itemname ~= ":"
		  and minetest.get_all_craft_recipes(itemname) ~= nil
		  and minetest.registered_items[itemname]
		  and minetest.registered_items[itemname].emc == nil then

			for _, recipe in pairs(minetest.get_all_craft_recipes(itemname)) do
				local emcvalue = 0

				if recipe.type == "cooking" and minetest.registered_items[recipe.items[1].emc] ~= nil then
					emcvalue = minetest.registered_items[recipe.items[1]].emc * 1.5
					-- table.insert(exceptions, itemname)

				else
					for _,item in pairs(recipe.items) do
						if string.sub(item,1,string.len("group:"))=="group:" then
							local current_emc = 0
							for _,definition in pairs(minetest.registered_nodes) do 
								if definition.groups[item] and definition.emc ~= nil then
									if definition.emc < current_emc then
										current_emc = definition.emc

									elseif current_emc == 0 then
										current_emc = definition.emc
									end
								end
							end
							emcvalue = current_emc
						elseif minetest.registered_items[item] and minetest.registered_items[item].emc then
							emcvalue = emcvalue + minetest.registered_items[item].emc
						else
							emcvalue = nil
							break
						end
					end
					output_number = recipe.output:split(" ")
					local craft_number
					if output_number[2] then
						craft_number = tonumber(output_number[2])
					else
						craft_number = 1
					end
					if emcvalue ~= nil then
						emcvalue = emcvalue / craft_number
					end
				end
				local_emcs[itemname] = emcvalue
			end
		end
	end
	for item, value in pairs(local_emcs) do
		minetest.override_item(item, {
			description = minetest.registered_items[item].description.."\nEMC Value: "..value,
			emc = value,
		})
	end
	local_emcs = {}
end
