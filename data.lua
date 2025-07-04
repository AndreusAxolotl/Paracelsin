table.insert(data.raw.lab["lab"].inputs, "galvanization-science-pack")
table.insert(data.raw.lab["biolab"].inputs, "galvanization-science-pack")

local function add_additional_categories(recipe_name, categories)
    local recipe = data.raw.recipe[recipe_name]
    if recipe and categories then
        recipe.additional_categories = recipe.additional_categories or {}
        for _, cat in pairs(categories) do
            table.insert(recipe.additional_categories, cat)
        end
    end
end
add_additional_categories("engine-unit", {"mechanics"})
add_additional_categories("electric-engine-unit", {"mechanics"})
add_additional_categories("repair-pack", {"mechanics"})
add_additional_categories("express-transport-belt", {"mechanics"})
add_additional_categories("express-underground-belt", {"mechanics"})
add_additional_categories("express-splitter", {"mechanics"})
add_additional_categories("inserter", {"mechanics"})
add_additional_categories("burner-inserter", {"mechanics"})
add_additional_categories("long-handed-inserter", {"mechanics"})
add_additional_categories("fast-inserter", {"mechanics"})
add_additional_categories("bulk-inserter", {"mechanics"})
add_additional_categories("stack-inserter", {"mechanics"})
add_additional_categories("pipe", {"mechanics"})
add_additional_categories("pipe-to-ground", {"mechanics"})
add_additional_categories("storage-tank", {"mechanics"})
add_additional_categories("flying-robot-frame", {"mechanics"})
add_additional_categories("construction-robot", {"mechanics"})
add_additional_categories("logistic-robot", {"mechanics"})
add_additional_categories("rail", {"mechanics"})
add_additional_categories("rail-support", {"mechanics"})
add_additional_categories("rail-ramp", {"mechanics"})
add_additional_categories("pump", {"mechanics"})
add_additional_categories("low-density-structure", {"mechanics"})
add_additional_categories("concrete", {"electrochemistry"})
add_additional_categories("refined-concrete", {"electrochemistry"})
add_additional_categories("plastic-bar", {"electrochemistry"})
add_additional_categories("sulfur", {"electrochemistry"})
add_additional_categories("battery", {"electrochemistry"})
add_additional_categories("sulfuric-acid", {"electrochemistry"})

if settings.startup["paracelsin-zinc-implementation"].value then
table.insert(data.raw.recipe["quantum-processor"].ingredients, {type = "item", name = "zinc-solder",       amount = 2})
table.insert(data.raw.recipe["railgun"].ingredients, {type = "item", name = "electric-coil",       amount = 20})
table.insert(data.raw.recipe["railgun-turret"].ingredients, {type = "item", name = "electric-coil",       amount = 50})
table.insert(data.raw.recipe["fusion-reactor"].ingredients, {type = "item", name = "electric-coil",       amount = 200})
table.insert(data.raw.recipe["fusion-generator"].ingredients, {type = "item", name = "electric-coil",       amount = 50})
table.insert(data.raw.recipe["fusion-reactor-equipment"].ingredients, {type = "item", name = "electric-coil",       amount = 25})
  end
  
data.raw.recipe["elevated-pipe"].ingredients = {
    {type = "item", name = "zinc-pipe", amount = 2},
    {type = "item", name = "zinc-rivets", amount = 20},
    {type = "item", name = "iron-stick", amount = 10},
    {type = "item", name = "zinc-plate", amount = 5},
  }
data.raw.recipe["elevated-pipe"].auto_recycle = true
data.raw.recipe["elevated-pipe"].category = "mechanics"
data.raw.recipe["elevated-pipe"].subgroup = "zinc-pipe"
data.raw.item["elevated-pipe"].subgroup = "zinc-pipe"
data.raw.item["elevated-pipe"].order = "e"
data.raw.recipe["elevated-pipe"].surface_conditions = {{property = "pressure", min = 5300, max = 5300}}
data.raw.item["elevated-pipe"].default_import_location = "paracelsin"
data.raw.item["elevated-pipe"].weight = 50000
data.raw.recipe["solar-matrix"].energy_required = 20
data.raw.recipe["solar-matrix"].ingredients = {
    {type = "item", name = "superconductor", amount = 5},
    {type = "item", name = "zinc-solder", amount = 10},
    {type = "item", name = "electric-coil", amount = 2},
    {type = "item", name = "carbon-fiber", amount = 5},
    {type = "fluid", name = "nitrogen", amount = 25},
  }
data.raw.recipe["solar-matrix"].category = "mechanics"
data.raw.item["solar-matrix"].order = "d[solar-panel]-b[solar-matrix]"
data.raw.recipe["solar-matrix"].surface_conditions = {{property = "pressure", min = 5300, max = 5300}}
data.raw.item["solar-matrix"].default_import_location = "paracelsin"
data.raw.item["solar-matrix"].weight = 100000
data.raw.recipe["accumulator-v2"].energy_required = 20
data.raw.recipe["accumulator-v2"].ingredients = {
    {type = "item", name = "supercapacitor", amount = 4},
    {type = "item", name = "zinc-solder", amount = 5},
    {type = "item", name = "electric-coil", amount = 5},
    {type = "item", name = "tungsten-carbide", amount = 15},
    {type = "fluid", name = "nitric-acid", amount = 25},
  }
data.raw.recipe["accumulator-v2"].category = "electrochemistry"
data.raw.recipe["accumulator-v2"].surface_conditions = {{property = "pressure", min = 5300, max = 5300}}
data.raw.item["accumulator-v2"].default_import_location = "paracelsin"
data.raw.item["accumulator-v2"].weight = 100000

local function add_player_crafting_categories(categories)
    local entity = data.raw.character.character
    for _,category in pairs(categories) do
      table.insert(entity.crafting_categories, category)
    end
  end
  
  add_player_crafting_categories({"hand-crafting"})

require "prototypes.items"
require "prototypes.machines"
require "prototypes.tiles"
require "prototypes.asteroid-spawn-definitions"
require "prototypes.planet"
require "prototypes.ambient-sounds"
require "prototypes.recipes"
require "prototypes.resources"
require "prototypes.technology"
require "prototypes.zinc-pipes"
require "prototypes.tips-and-tricks"