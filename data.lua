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
data.raw.recipe["quantum-processor"].ingredients =
    {
      {type = "item", name = "tungsten-carbide", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "superconductor", amount = 1},
      {type = "item", name = "carbon-fiber", amount = 1},
      {type = "item", name = "lithium-plate", amount = 2},
      {type = "item", name = "zinc-solder",       amount = 2},
      {type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_stats = 5},
    }
data.raw.recipe["railgun"].ingredients = 
   {
      {type = "item", name = "tungsten-plate", amount = 10},
      {type = "item", name = "superconductor", amount = 10},
      {type = "item", name = "quantum-processor", amount = 20},
      {type = "item", name = "electric-coil", amount = 20},
      {type = "fluid", name = "fluoroketone-cold", amount = 10}
    }
data.raw.recipe["railgun-turret"].ingredients =
    {
      {type = "item", name = "quantum-processor", amount = 100},
      {type = "item", name = "tungsten-plate", amount = 30},
      {type = "item", name = "superconductor", amount = 50},
      {type = "item", name = "carbon-fiber", amount = 20},
      {type = "item", name = "electric-coil", amount = 50},
      {type = "fluid", name = "fluoroketone-cold", amount = 100}
    }
data.raw.recipe["fusion-reactor"].ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 200},
      {type = "item", name = "superconductor", amount = 200},
      {type = "item", name = "electric-coil", amount = 200},
      {type = "item", name = "quantum-processor", amount = 250},
    }
data.raw.recipe["fusion-generator"].ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 100},
      {type = "item", name = "superconductor", amount = 100},
      {type = "item", name = "quantum-processor", amount = 50},
      {type = "item", name = "electric-coil", amount = 50},
    }
data.raw.recipe["fusion-reactor-equipment"].ingredients =
    {
      {type = "item", name = "fission-reactor-equipment", amount = 1},
      {type = "item", name = "fusion-power-cell", amount = 10},
      {type = "item", name = "tungsten-plate", amount = 250},
      {type = "item", name = "carbon-fiber", amount = 100},
      {type = "item", name = "supercapacitor", amount = 25},
      {type = "item", name = "electric-coil", amount = 25},
      {type = "item", name = "quantum-processor", amount = 250}
    }
  end
  
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