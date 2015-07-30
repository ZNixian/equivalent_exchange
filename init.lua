dofile(minetest.get_modpath("equivalent_exchange").."/emcs.lua")
dofile(minetest.get_modpath("equivalent_exchange").."/alchemical_chest.lua")
dofile(minetest.get_modpath("equivalent_exchange").."/alchemy_bag.lua")
dofile(minetest.get_modpath("equivalent_exchange").."/condenser.lua")
dofile(minetest.get_modpath("equivalent_exchange").."/covalence_dust.lua")
dofile(minetest.get_modpath("equivalent_exchange").."/energy_collector.lua")

if minetest.get_modpath("buildtest")~=nil then
	buildtest.canPumpInto["equivalent_exchange:condenser"] = {
		"from",
		on_send = function(pos)
			equivalent_exchange.convert(pos)
		end	
	}
	buildtest.pumps.pulls["equivalent_exchange:condenser"] = {"from"}
end

print("[equivalent_exchange] Mod loaded!")