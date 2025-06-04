data:extend {
  {
    type = "technology",
    name = "paracelsin-planet-discovery-paracelsin",
    icons = util.technology_icon_constant_planet("__Paracelsin-Graphics__/graphics/technology/planet-discovery-paracelsin.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "paracelsin",
        use_icon_overlay_constant = true
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-nitric-acid",
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-solid-fuel-from-nitrogen"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-nitric-acid-rocket-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-nitric-acid-plastic"
      },
    },
    prerequisites = { "rocket-turret", "advanced-asteroid-processing", "heating-tower", "asteroid-reprocessing", "electromagnetic-science-pack" },
    unit =
    {
      count = 2500,
      ingredients =
      {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "metallurgic-science-pack",     1 },
        { "agricultural-science-pack",    1 },
        { "electromagnetic-science-pack", 1 }
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "paracelsin-vaterite-processing",
    icon = "__Paracelsin-Graphics__/graphics/technology/vaterite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "paracelsin-vaterite-processing"
      },
    },
    prerequisites = { "paracelsin-planet-discovery-paracelsin" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "vaterite"
    }
  },
  {
    type = "technology",
    name = "paracelsin-sphalerite-processing",
    icon = "__Paracelsin-Graphics__/graphics/technology/sphalerite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "paracelsin-sphalerite-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-leaching"
      },
    },
    prerequisites = { "paracelsin-vaterite-processing" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "sphalerite"
    }
  },
  {
    type = "technology",
    name = "paracelsin-tetrahedrite-processing",
    icon = "__Paracelsin-Graphics__/graphics/technology/tetrahedrite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "paracelsin-tetrahedrite-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-leaching"
      },
    },
    prerequisites = { "paracelsin-vaterite-processing" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "tetrahedrite"
    }
  },
  {
    type = "technology",
    name = "paracelsin-zinc-extraction",
    icon = "__Paracelsin-Graphics__/graphics/technology/zinc-extraction.png",
    icon_size = 256,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-purification"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-solder"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-rivets"
      },
    },
    prerequisites = { "paracelsin-sphalerite-processing", "paracelsin-tetrahedrite-processing" },
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "paracelsin-dirty-zinc-solution"
    }
  },
  {
    type = "technology",
    name = "paracelsin-electrochemical-plant",
    icon = "__Paracelsin-Graphics__/graphics/technology/electrochemical-plant.png",
    icon_size = 256,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "paracelsin-electrochemical-plant"
      }
    },
    prerequisites = { "paracelsin-zinc-extraction" },
    research_trigger =
    {
      type = "craft-item",
      item = "paracelsin-zinc-solder"
    }
  },
  {
    type = "technology",
    name = "paracelsin-mechanical-plant",
    icon = "__Paracelsin-Graphics__/graphics/technology/mechanical-plant.png",
    icon_size = 256,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "paracelsin-mechanical-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-electric-coil"
      }
    },
    prerequisites = { "paracelsin-zinc-extraction" },
    research_trigger =
    {
      type = "craft-item",
      item = "paracelsin-zinc-rivets"
    }
  },
  {
    type = "technology",
    name = "paracelsin-galvanization-science-pack",
    icon = "__Paracelsin-Graphics__/graphics/technology/galvanization-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "paracelsin-galvanization-science-pack"
      },

    },
    prerequisites = { "paracelsin-mechanical-plant", "paracelsin-electrochemical-plant" },
    research_trigger =
    {
      type = "craft-item",
      item = "paracelsin-electric-coil",
      count = 100
    },
  },
  {
    type = "technology",
    name = "paracelsin-vaterite-processing-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__Paracelsin-Graphics__/graphics/technology/vaterite-processing-prod.png"),

    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "paracelsin-vaterite-processing",
        change = 0.1
      },
    },
    prerequisites = { "paracelsin-galvanization-science-pack" },
    unit =
    {
      count_formula = "1.5^L*500",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "space-science-pack",                    1 },
        { "paracelsin-galvanization-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "paracelsin-concrete-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__base__/graphics/technology/concrete.png"),

    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "concrete",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "refined-concrete",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "concrete-from-molten-iron",
        change = 0.1
      },
    },
    prerequisites = { "paracelsin-galvanization-science-pack" },
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "metallurgic-science-pack",              1 },
        { "paracelsin-galvanization-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "paracelsin-galvanized-casting",
    icon = "__Paracelsin-Graphics__/graphics/technology/galvanization.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "paracelsin-casting-galvanized-iron-gear-wheel"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-casting-galvanized-iron-stick"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-casting-galvanized-steel-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-casting-galvanized-low-density-structure"
      }, },
    prerequisites = { "paracelsin-galvanization-science-pack" },
    unit =
    {
      count = 3000,
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "metallurgic-science-pack",              1 },
        { "paracelsin-galvanization-science-pack", 1 }
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "paracelsin-zinc-piping",
    icons =
    {
      {
        icon = "__base__/graphics/technology/fluid-handling.png",
        icon_size = 256,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "paracelsin-zinc-pipe-to-ground"
      }, },
    prerequisites = { "paracelsin-galvanization-science-pack" },
    unit =
    {
      count = 1000,
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "paracelsin-galvanization-science-pack", 1 }
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "paracelsin-axe-mining-speed",
    icons = util.technology_icon_constant_speed("__Paracelsin-Graphics__/graphics/technology/zinc-axe.png"),
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.1
      }
    },
    prerequisites = { "paracelsin-galvanized-casting", "steel-axe" },
    unit =
    {
      count_formula = "2^L*500",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "paracelsin-galvanization-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "paracelsin-advanced-repair-device",
    icon = "__Paracelsin-Graphics__/graphics/technology/advanced-repair-device.png",
    icon_size = 256,

    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "paracelsin-advanced-repair-device"
      }, },
    prerequisites = { "paracelsin-galvanization-science-pack", "repair-pack"},
    unit =
    {
      count = 3000,
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "logistic-science-pack",                 1 },
        { "chemical-science-pack",                 1 },
        { "production-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "paracelsin-galvanization-science-pack", 1 }
      },
      time = 60
    }
  },
}
data.raw.technology["elevated-pipe"].prerequisites = { "paracelsin-zinc-piping" }
data.raw.technology["elevated-pipe"].unit =
{
  count = 3000,
  ingredients =
  {
    { "automation-science-pack",               1 },
    { "logistic-science-pack",                 1 },
    { "chemical-science-pack",                 1 },
    { "utility-science-pack",                  1 },
    { "space-science-pack",                    1 },
    { "paracelsin-galvanization-science-pack", 1 }
  },
  time = 60
}
data.raw.technology["elevated-pipe"].effects =
{
  {
    type = "unlock-recipe",
    recipe = "elevated-pipe"
  },
}

local function add_tech_prerequisites(tech_name, prerequisites)
  local tech = data.raw.technology[tech_name]
  tech.prerequisites = tech.prerequisites or {}
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prerequisites then
      return
    end
  end
  table.insert(tech.prerequisites, prerequisites)
end


local function add_science_pack(tech_name, science_pack)
  local tech = data.raw.technology[tech_name]
  tech.unit.ingredients = tech.unit.ingredients or {}
  table.insert(tech.unit.ingredients, science_pack)
end
local function add_tech_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  tech.effects = tech.effects or {}
  table.insert(tech.effects, effect)
end
add_science_pack("promethium-science-pack", { "paracelsin-galvanization-science-pack", 1 })
add_science_pack("fusion-reactor", { "paracelsin-galvanization-science-pack", 1 })
add_science_pack("research-productivity", { "paracelsin-galvanization-science-pack", 1 })
add_tech_prerequisites("fusion-reactor", "paracelsin-galvanization-science-pack")
add_tech_effect("plastic-bar-productivity",
  { type = "change-recipe-productivity", recipe = "paracelsin-nitric-acid-plastic", change = 0.1 })
add_tech_effect("rocket-fuel-productivity",
  { type = "change-recipe-productivity", recipe = "paracelsin-nitric-acid-rocket-fuel", change = 0.1 })
add_tech_effect("steel-plate-productivity",
  { type = "change-recipe-productivity", recipe = "paracelsin-casting-galvanized-steel-plate", change = 0.1 })
add_tech_effect("low-density-structure-productivity",
  { type = "change-recipe-productivity", recipe = "paracelsin-casting-galvanized-low-density-structure", change = 0.1 })
