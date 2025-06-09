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

--temp

require "prototypes.items"
require "prototypes.machines"
require "prototypes.tiles"
require "prototypes.planet"
require "prototypes.ambient-sounds"
require "prototypes.recipes"
require "prototypes.resources"
require "prototypes.technology"
require "prototypes.zinc-pipes"
require "prototypes.tips-and-tricks"