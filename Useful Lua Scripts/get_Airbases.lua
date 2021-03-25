JSON = require("")  -- <<--- Put full path to JSON.lua here

--local pretty_json_text = JSON:encode_pretty(lua_table_or_value) -- 
--"pretty printed" version



function onTakeoffEvent(event)

  trigger.action.outText("In event", 30)
  
--[[

Envrioment:	Mission Scripting
Function:	getAirbases	Added with: 1.2.4
Member Of:	coalition, world
Syntax:	table coalition.getAirbases(enum coalitionId )
Description:	Returns a table of airbase objects belonging to the specified coalition. Objects can be ships, static objects(FARP), or airbases on the map.
When the function is run as world.getAirbases() no input values required, and the function returns all airbases, ships, and farps on the map.


Return Value:	table
Return Example:	
Examples:	The following iterates the returned airbases via world.getAirbases() and stores callsign, id, and other useful information in another table.
   local base = world.getAirbases()
   local myBaseTbl = {}
   for i = 1, #base do
       local info = {}
       info.desc = Airbase.getDesc(base[i])
       info.callsign = Airbase.getCallsign(base[i])
       info.id = Airbase.getID(base[i])
       info.cat = Airbase.getCategory(base[i])
       info.point = Airbase.getPoint(base[i])
       if Airbase.getUnit(base[i]) then
           info.unitId = Airbase.getUnit(base[i]):getID()
       end
       
       myBaseTbl[info.callsign] = info
   end
Related Functions:	Coalition Functions: addGroup, addStaticObject, getGroups, getStaticObjects, getAirbases. getPlayers, getServiceProviders, addRefPoint, getRefPoints, getMainRefPoint, getCountryCoalition
World functions: addEventHandler, removeEventHandler, getPlayer, getAirbases, searchObjects, getMarkPanels

Notes:	
Categories: ScriptingFunctionsSingleton Functions

]]--

	local base = world.getAirbases()
	local myBaseTbl = {}
	for i = 1, #base do
	   local info = {}
	   --info.desc = Airbase.getDesc(base[i])
	   --info.callsign = Airbase.getCallsign(base[i])
	   --info.id = Airbase.getID(base[i])
	   --info.cat = Airbase.getCategory(base[i])
	   --info.point = Airbase.getPoint(base[i])
	   info.name = Airbase.getName(base[i])
	   
	   if Airbase.getUnit(base[i]) then
		   info.unitId = Airbase.getUnit(base[i]):getID()
	   end
	   
	   myBaseTbl[info.name] = info
	end

	local JSON_Out = JSON:encode_pretty(myBaseTbl)
	
	file = io.open("", "w+") --PUT FILE PATH HERE
	file.write(JSON_Out)
	file:close()

	TakeoffHandler = {}

  
end

function TakeoffHandler:onEvent(event)
  onTakeoffEvent(event)
end

world.addEventHandler(TakeoffHandler)