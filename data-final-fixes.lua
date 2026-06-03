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