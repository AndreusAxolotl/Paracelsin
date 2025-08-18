data:extend {
  {
    type = "technology",
    name = "planet-discovery-paracelsin",
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
    },
    prerequisites = { "rocket-turret", "advanced-asteroid-processing", "heating-tower", "asteroid-reprocessing", "electromagnetic-science-pack" },
    unit =
    {
      count = 3000,
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
    name = "cryovolcanic-power",
    icon = "__Paracelsin-Graphics__/graphics/technology/cryovolcanic-power.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "burner-pumpjack"
      },
      {
        type = "unlock-recipe",
        recipe = "cryovolcanic-turbine"
      },
    },
    prerequisites = { "planet-discovery-paracelsin" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "crashed-fulgoran-pod"
    }
  },
  {
    type = "technology",
    name = "nitric-acid-handling",
    icon = "__Paracelsin-Graphics__/graphics/technology/nitric-acid-handling.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nitrogen-nitric-acid",
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-nitrogen"
      },
      {
        type = "unlock-recipe",
        recipe = "nitric-acid-rocket-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "nitric-acid-plastic"
      },
      {
        type = "unlock-recipe",
        recipe = "lubricant-from-nitric-acid"
      },
    },
    prerequisites = { "planet-discovery-paracelsin" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "big-metallic-rock"
    }
  },
  {
    type = "technology",
    name = "vaterite-processing",
    icon = "__Paracelsin-Graphics__/graphics/technology/vaterite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "vaterite-processing"
      },
    },
    prerequisites = { "nitric-acid-handling", "cryovolcanic-power"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "vaterite"
    }
  },
  {
    type = "technology",
    name = "sphalerite-processing",
    icon = "__Paracelsin-Graphics__/graphics/technology/sphalerite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sphalerite-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "sphalerite-melting"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-leaching"
      },
    },
    prerequisites = { "vaterite-processing" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "sphalerite"
    }
  },
  {
    type = "technology",
    name = "tetrahedrite-processing",
    icon = "__Paracelsin-Graphics__/graphics/technology/tetrahedrite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tetrahedrite-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "tetrahedrite-melting"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-leaching"
      },
    },
    prerequisites = { "vaterite-processing" },
    research_trigger =
    {
      type = "mine-entity",
      entity = "tetrahedrite"
    }
  },
  {
    type = "technology",
    name = "zinc-extraction",
    icon = "__Paracelsin-Graphics__/graphics/technology/zinc-extraction.png",
    icon_size = 256,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "zinc-purification"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-solder"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-rivets"
      },
    },
    prerequisites = { "sphalerite-processing", "tetrahedrite-processing" },
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "dirty-zinc-solution"
    }
  },
  {
    type = "technology",
    name = "electrochemical-plant",
    icon = "__Paracelsin-Graphics__/graphics/technology/electrochemical-plant.png",
    icon_size = 256,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "electrochemical-plant"
      },
            {
        type = "unlock-recipe",
        recipe = "paracelsin-processing-units-from-nitric-acid"
      }
    },
    prerequisites = { "zinc-extraction" },
    research_trigger =
    {
      type = "craft-item",
      item = "zinc-solder"
    }
  },
  {
    type = "technology",
    name = "mechanical-plant",
    icon = "__Paracelsin-Graphics__/graphics/technology/mechanical-plant.png",
    icon_size = 256,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "mechanical-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "electric-coil"
      },
            {
        type = "unlock-recipe",
        recipe = "batteries-from-nitric-acid"
      }
    },
    prerequisites = { "zinc-extraction" },
    research_trigger =
    {
      type = "craft-item",
      item = "zinc-rivets"
    }
  },
  {
    type = "technology",
    name = "galvanization-science-pack",
    icon = "__Paracelsin-Graphics__/graphics/technology/galvanization-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {

      {
        type = "unlock-recipe",
        recipe = "galvanization-science-pack"
      }
    },
    prerequisites = { "mechanical-plant", "electrochemical-plant" },
    research_trigger =
    {
      type = "craft-item",
      item = "electric-coil",
      count = 100
    },
  },
  {
    type = "technology",
    name = "vaterite-processing-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__Paracelsin-Graphics__/graphics/technology/vaterite-processing-prod.png"),

    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "vaterite-processing",
        change = 0.1
      },
    },
    prerequisites = { "galvanization-science-pack" },
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
        { "galvanization-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "concrete-productivity",
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
    prerequisites = { "galvanization-science-pack" },
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
        { "galvanization-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "zinc-piping",
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
        recipe = "zinc-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-pipe-to-ground"
      }, 
      {
        type = "unlock-recipe",
        recipe = "zinc-storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "zinc-pump"
      }, 
    },
    prerequisites = { "galvanization-science-pack" },
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
        { "galvanization-science-pack", 1 }
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "axe-mining-speed",
    icons = util.technology_icon_constant_speed("__Paracelsin-Graphics__/graphics/technology/zinc-axe.png"),
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.1
      }
    },
    prerequisites = { "galvanization-science-pack", "steel-axe" },
    unit =
    {
      count_formula = "2^L*500",
      ingredients =
      {
        { "automation-science-pack",               1 },
        { "utility-science-pack",                  1 },
        { "space-science-pack",                    1 },
        { "galvanization-science-pack", 1 }
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "advanced-repair-device",
    icon = "__Paracelsin-Graphics__/graphics/technology/advanced-repair-device.png",
    icon_size = 256,

    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-repair-device"
      }, },
    prerequisites = { "galvanization-science-pack", "repair-pack"},
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
        { "galvanization-science-pack", 1 }
      },
      time = 60
    }
  },
}
data.raw.technology["elevated-pipe"].prerequisites = { "zinc-piping" }
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
    { "galvanization-science-pack", 1 }
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
data.raw.technology["solar-matrix"].prerequisites = { "galvanization-science-pack" }
data.raw.technology["solar-matrix"].unit =
{
  count = 2000,
  ingredients =
  {
    { "automation-science-pack",               1 },
    { "logistic-science-pack",                 1 },
    { "chemical-science-pack",                 1 },
    { "production-science-pack",                  1 },
    { "space-science-pack",                    1 },
    { "electromagnetic-science-pack", 1 },
    { "agricultural-science-pack", 1 },
    { "galvanization-science-pack", 1 }
  },
  time = 60
}
data.raw.technology["accumulator-v2"].prerequisites = { "galvanization-science-pack" }
data.raw.technology["accumulator-v2"].unit =
{
  count = 2000,
  ingredients =
  {
    { "automation-science-pack",               1 },
    { "logistic-science-pack",                 1 },
    { "chemical-science-pack",                 1 },
    { "production-science-pack",                  1 },
    { "space-science-pack",                    1 },
    { "electromagnetic-science-pack", 1 },
    { "metallurgic-science-pack", 1 },
    { "galvanization-science-pack", 1 }
  },
  time = 60
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
add_science_pack("promethium-science-pack", { "galvanization-science-pack", 1 })
add_science_pack("fusion-reactor", { "galvanization-science-pack", 1 })
add_science_pack("railgun", { "galvanization-science-pack", 1 })
add_science_pack("quantum-processor", { "galvanization-science-pack", 1 })
add_science_pack("research-productivity", { "galvanization-science-pack", 1 })
add_science_pack("railgun-shooting-speed-1", { "galvanization-science-pack", 1 })
add_science_pack("railgun-damage-1", { "galvanization-science-pack", 1 })
add_tech_prerequisites("quantum-processor", "galvanization-science-pack")
add_tech_effect("plastic-bar-productivity",
  { type = "change-recipe-productivity", recipe = "nitric-acid-plastic", change = 0.1 })
add_tech_effect("rocket-fuel-productivity",
  { type = "change-recipe-productivity", recipe = "nitric-acid-rocket-fuel", change = 0.1 })
