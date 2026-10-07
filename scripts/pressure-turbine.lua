local handler = require("__PlanetsLib__.lib.event-handler.event-handler")
-- include the built in "on_built" and "on_removed" composite events
handler.add_composite_events(require("__PlanetsLib__.lib.event-handler.composite-events"))

-- using the name of a composite event is also valid for a filter, it will apply to every included event.
handler.add_filter("on_built", {
    filter = "name",
    name = "pressure-turbine"
})
handler.add_filter("on_removed", {
    filter = "name",
    name = "pressure-turbine"
})
--in your handler code
local lib = {
    composite_events = {
        on_built = function(event)
            local entity                    = event.entity
            -- if entity.name == "pressure-turbine" then return end
            local surface                   = entity.surface
            local interface                 = surface.create_entity { name = "pressure-turbine-energy-interface", position = entity.position, force = entity.force, create_build_effect_smoke = false }
            local turbines                  = storage["turbines"] or {}
            storage["turbines"]             = turbines
            turbines[entity.unit_number]    = {
                interface = interface,
            }
            interface.destructible          = false
            interface.operable              = false
        end,
        on_removed = function(event)
            local entity = event.entity
            -- if entity.name == "pressure-turbine" then return end
            local turbines = storage["turbines"] or {}
            local data = turbines[entity.unit_number]
            if data ~= nil then
                if data.interface.valid then
                    data.interface.destructible = true
                    data.interface.destroy()
                end
                turbines[entity.unit_number] = nil
            end
        end
    },
    events = {
        ---@param event EventData.on_resource_depleted
        [defines.events.on_resource_depleted] = function(event)
            local resource = event.entity
           if resource.prototype.resource_category ~= "gas-vents" then return end
           resource.surface.find_entity("pressure-turbine-energy-interface", resource.position).disabled_by_script = true
        end
    }
}
return lib
