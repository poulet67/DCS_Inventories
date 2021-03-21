--dofile('master_displayNames_table.lua') --or maybe require... lua is fucked up
--dofile('syria_master_Airbase_name_table.lua') --or maybe require... lua is fucked up
--dofile('master_airframes_table.lua') --or maybe require... lua is fucked up

--initial weapons quantities (usually 0, since this is a massive table and people will be whitelisting)

function init_inventories()

	INITIALWEAPONQUANTITY = 0
	INITIALAIRCRAFTQUANTITY = 0

	inventories = {}
	weapon_entry_table = {}
	airframes_entry_table = {}

	function deepcopy(orig)
		local orig_type = type(orig)
		local copy
		if orig_type == 'table' then
			copy = {}
			for orig_key, orig_value in next, orig, nil do
				copy[deepcopy(orig_key)] = deepcopy(orig_value)
			end
			setmetatable(copy, deepcopy(getmetatable(orig)))
		else -- number, string, boolean, etc
			copy = orig
		end
		return copy
	end

	for k, v in pairs(master_displayNames_table) do

		weapon_entry_table[k] = {displayName = v,
								 quantity = 0,
								 hidden = false, --will likely make use of this for web app plans
								 authorized = true --more grand plans?							 
								}
		
	end

	for k, v in pairs(master_airframes_table) do

		airframes_entry_table[k] = {displayName = v,
									quantity = INITIALAIRCRAFTQUANTITY,
									hidden = false, --will likely make use of this for web app plans						 
									}
		
	end

	for k, v in pairs(syria_master_Airbase_name_table) do

		inventories[k] = {Airbase = v,
						  Weapons = deepcopy(weapon_entry_table),
						  Airframes = deepcopy(master_airframes_table),
						  Fuel = 1000000,
						  PilotLives = 500,
						  GroundWeapons = 1000				  
						  }
						  
	end
	
end