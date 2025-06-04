local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local function create_tiles()
  return {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-inner-explosion",
          offsets = {{0.5, 0.5}}
        },
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-outer-explosion",
          offsets = {{0.5, 0.5}}
        }
      }
    }
  }
end

data:extend({
{
    type = "resource",
    name = "sphalerite",
    icon = "__Paracelsin-Graphics__/graphics/icons/sphalerite-1.png",
    flags = {"placeable-neutral"},
    order = "x",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    walking_sound = tile_sounds.walking.ore,
    driving_sound = tile_sounds.driving.stone,
    category = "hard-solid",
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      result = "sphalerite",
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "sphalerite",
      order = "x",
      base_density = 1,
      base_spots_per_km2 = 1.5,
      has_starting_area_placement = true,
      random_spot_size_minimum = 3,
      random_spot_size_maximum = 6,
      regular_rq_factor_multiplier = 1
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/tungsten-ore/tungsten-ore.png",
        priority = "extra-high",
        tint = {r = 181/256, g = 229/256, b = 255/256, a = 1.000},
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      },
    },
    mining_visualisation_tint = {r = 181/256, g = 229/256, b = 255/256, a = 1.000},
    map_color = {r = 181/256, g = 229/256, b = 255/256, a = 1.000}
  },
  {
    type = "resource",
    name = "tetrahedrite",
    icon = "__Paracelsin-Graphics__/graphics/icons/tetrahedrite-1.png",
    flags = {"placeable-neutral"},
    order = "y",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    walking_sound = tile_sounds.walking.ore,
    driving_sound = tile_sounds.driving.stone,
    category = "hard-solid",
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      result = "tetrahedrite",
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "tetrahedrite",
      order = "y",
      base_density = 0.9,
      base_spots_per_km2 = 1.2,
      has_starting_area_placement = true,
      random_spot_size_minimum = 2,
      random_spot_size_maximum = 5,
      regular_rq_factor_multiplier = 1
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/tungsten-ore/tungsten-ore.png",
        priority = "extra-high",
        tint = {r = 167/256, g = 121/256, b = 107/256, a = 1.000},
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      },
    },
    mining_visualisation_tint = {r = 167/256, g = 121/256, b = 107/256, a = 1.000},
    map_color = {r = 167/256, g = 121/256, b = 107/256, a = 1.000}
  },
  {
    type = "resource",
    name = "vaterite",
    icon = "__Paracelsin-Graphics__/graphics/icons/vaterite-1.png",
    flags = {"placeable-neutral"},
    order = "z",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    walking_sound = tile_sounds.walking.ore,
    driving_sound = tile_sounds.driving.stone,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1.5,
      result = "vaterite",
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "vaterite",
      order = "z",
      base_density = 0.5,
      base_spots_per_km2 = 2,
      has_starting_area_placement = true,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 8,
      regular_rq_factor_multiplier = 1
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/calcite/calcite.png",
        priority = "extra-high",
        tint = {r = 205/256, g = 201/256, b = 182/256, a = 1.000},
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      },
    },
    mining_visualisation_tint = {r = 205/256, g = 201/256, b = 182/256, a = 1.000},
    map_color = {r = 205/256, g = 201/256, b = 182/256, a = 1.000}
  },
  {
    type = "resource",
    name = "water-cryovolcano",
    icon = "__space-age__/graphics/icons/fluorine-vent.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="z",
    highlight = true,
    normal = 5000,
    resource_patch_search_radius = 16,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "water",
          amount_min = 1,
          amount_max = 5,
          probability = 1
        }
      }
    },
    walking_sound = tile_sounds.walking.oil({}),
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
      order="z",
      probability_expression = "aquilo_lithium_brine_probability",
      richness_expression = "aquilo_lithium_brine_richness"
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/fluorine-vent/fluorine-vent",
        {
          priority = "extra-high",
          frame_count = 4,
          scale = 0.5
        })
      }
    },
    draw_stateless_visualisation_under_building = false,
    stateless_visualisation =
    {
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0.25, g=0.5, b=0.5,a= 1},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0, g=0.9, b=1,a= 0.35},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, 24 -152),
          scale = 1.5,
          tint = util.multiply_color({r=0.5, g=1, b=1}, 0.1)
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 24 -78),
          scale = 1.5,
          tint = util.multiply_color({r=0, g=0.9, b=1}, 0.1)
        }
      }
    },
    map_color = {0.0, 0.8, 1.0},
    map_grid = false,
    created_effect = create_tiles("snow-patchy")
  }
})