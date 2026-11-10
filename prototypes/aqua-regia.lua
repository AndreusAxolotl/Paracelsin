if settings.startup["paracelsin-muria-aqua-regia"] == nil or not settings.startup["paracelsin-muria-aqua-regia"].value then return end
    
    local function set_recipe_category(recipe_names, category)
  for _, recipe_name in pairs(recipe_names) do
    if data.raw.recipe[recipe_name] then
      data.raw.recipe[recipe_name].categories = {category}
    end
  end
end
    
    data:extend {{
    type = "technology",
    name = "zinc-and-lead-refining",
    icon = "__Paracelsin-Graphics__/graphics/technology/aqua-regia.png",
    icon_size = 256,

    effects =
    {
        {
        type = "unlock-recipe",
        recipe = "aqua-regia"
      }, 
      {
        type = "unlock-recipe",
        recipe = "zinc-refining"
      }, 
      {
        type = "unlock-recipe",
        recipe = "lead-refining"
      }, 
    },
    prerequisites = {"galvanization-science-pack", "advanced-acid-processing", "cryogenic-science-pack"},
    unit =
    {
      count = 1500,
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "galvanization-science-pack", 1 },
        { "acidworking-science-pack", 1 },
        { "cryogenic-science-pack", 1 }
      },
      time = 60
    }
  },
{
    type = "fluid",
    name = "aqua-regia",
    subgroup = "fluid",
    default_temperature = -42,
    max_temperature = 108,
    base_color = {0.47, 0.28, 0.04},
    flow_color = {0.47, 0.28, 0.04},
    icon = "__Paracelsin-Graphics__/graphics/icons/aqua-regia.png",
    auto_barrel = false
  },
{
    type = "recipe",
    name = "aqua-regia",
    enabled = false,
    icon = "__Paracelsin-Graphics__/graphics/icons/aqua-regia.png",
    icon_size = 64,
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "nitric-acid", amount = 50},
        {type = "fluid", name = "hydrogen-chloride",   amount = 150},
        {type = "item", name = "calcite",   amount = 1, quality_min = "rare"}
    },
    results = {
        {type = "fluid", name = "aqua-regia", amount = 200},
    },
    allow_quality = false,
    categories = {"acidworking"},
    auto_recycle = false,
},}
data.raw.recipe["zinc-refining"].ingredients = {
        {type = "item", name = "zinc",   amount = 1},
        {type = "item", name = "calcite", amount = 1, quality_change = 1},
        {type = "fluid", name = "aqua-regia", amount = 100},
        {type = "fluid", name = "zinc-solution",   amount = 10},
  }
data.raw.recipe["lead-refining"].energy_required = 2.5
data.raw.recipe["lead-refining"].ingredients = {
        {type = "item", name = "lead",   amount = 1},
        {type = "item", name = "calcite", amount = 1, quality_change = 1},
        {type = "fluid", name = "aqua-regia", amount = 100},
        {type = "fluid", name = "molten-lead",   amount = 10},
  }
set_recipe_category({"lead-refining"}, "electrochemistry")