TakeoffHandler = {}

function onTakeoffEvent(event)

  trigger.action.outText(event.id, 30)
  
  if event.id == world.event.S_EVENT_TAKEOFF then
  
    trigger.action.outText("inside if!", 30)
	ammoTable = event.initiator:getAmmo()
	
    for k, v in pairs(ammoTable) do
        -- k is pylon v is table
        number = v.count 
        typestring = v.desc.typeName
        trigger.action.outText("Pylon "..k.." has "..number.." weapons of type "..typestring, 30)
	end

  end
  
end

function TakeoffHandler:onEvent(event)
  onTakeoffEvent(event)
end

world.addEventHandler(TakeoffHandler)
