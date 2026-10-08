local macerating = require("prototypes.macerating")
local generate_macerating_recipe = function(item)
  if item.parameter then return end

  if not data.raw.recipe[item.name .. "-macerating"] then
      macerating.generate_macerating_recipe(item)
  end
end

for type_name in pairs(defines.prototypes.item) do
  if data.raw[type_name] then
    for k, item in pairs(data.raw[type_name]) do
      generate_macerating_recipe(item)
    end
  end
end

local function has_value (list, val)
    for index, value in ipairs(list) do
        if value == val then
            return true
        end
    end

    return false
end

for name, drill in pairs(data.raw["mining-drill"]) do
   if has_value (drill.resource_categories, "basic-fluid") then
    table.insert(drill.resource_categories, "gas-vents")
   end
end


data.raw.resource["sulfuric-acid-geyser"].category = "gas-vents"
data.raw.resource["fluorine-vent"].category = "gas-vents"

if mods["Moshine"] then
data.raw.resource["steam-geyser"].category = "gas-vents"
end