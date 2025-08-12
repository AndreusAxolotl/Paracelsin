local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
require ("util")
require("__base__/prototypes/entity/pipecovers")
require ("circuit-connector-sprites")
require("__base__/prototypes/entity/assemblerpipes")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")
local cargo_pod_procession_catalogue = require("__base__/prototypes/entity/cargo-pod-catalogue")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")

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
          amount_min = 5,
          amount_max = 5,
          probability = 1,
          temperature = 30
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
  },
  {
        name = "crashed-fulgoran-pod",
        type = "simple-entity",
        flags = {"placeable-neutral", "placeable-off-grid"},
        icons =
    {
      {
        icon = "__base__/graphics/icons/cargo-pod.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
        subgroup = "grass",
        order = "b[decorative]-z-a",
        deconstruction_alternative = "big-rock",
        collision_mask = {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}}, 
        collision_box = {{-1.21, -0.86}, {1.21, 0.86}},
        selection_box = {{-1.41, -1.06}, {1.01, 0.66}},
        damaged_trigger_effect = hit_effects.rock(),
        render_layer = "object",
        autoplace = {
           probability_expression = 
            "0.0001 * (0.1 * (crash_cluster_mask)) \z
            + ((crash_frequency_scaled) + 0.006 * ((crash_size_scaled) - 0.3)) \z
            * (clamp( (crash_size_scaled) - abs(crash_cluster_noise), 0, 1))",
           local_expressions = {
              crash_size = "control:crashed_fulgoran_pod:size",
              crash_frequency = "control:crashed_fulgoran_pod:frequency",
              crash_size_scaled = "crash_size * (0.003)",
              crash_frequency_scaled = "crash_frequency * (7)",
              crash_cluster_noise = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 4, persistence = 0.5, input_scale = 1, output_scale = 1}",
              crash_cluster_mask = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 3, persistence = 0.6, input_scale = 1, output_scale = 1}",
          },
        },
        dying_trigger_effect = decorative_trigger_effects.big_rock(),
        minable =
        {
          mining_time = 5,
          results = {
            {type = "item", name = "iron-plate", amount_min = 2, amount_max = 15},
            {type = "item", name = "copper-plate", amount_min = 2, amount_max = 15},
            {type = "item", name = "electronic-circuit", amount_min = 2, amount_max = 10},
            {type = "item", name = "steel-plate", amount_min = 0, amount_max = 10},
            {type = "item", name = "tungsten-plate", amount_min = 5, amount_max = 10},
            {type = "item", name = "tungsten-carbide", amount_min = 5, amount_max = 10}        
        }
        },
        resistances =
        {
          {
            type = "fire",
            percent = 100
          }
        },
        map_color = {r = 181/256, g = 229/256, b = 255/256, a = 1.000},
        count_as_rock_for_filtered_deconstruction = true,
        mined_sound = sounds.deconstruct_bricks(1.0),
        impact_category = "metal",
        pictures =
        {
          {
            filename = "__base__/graphics/entity/cargo-pod/pod-corpse.png",
            width = 266,
            height = 252,
            scale = 0.5,
            shift = {0.25, 0.0625},
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 } 
          }
        }
    },
    {
    name = "big-metallic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    subgroup = "grass",
    order = "b-l-z-a",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      order = "a[landscape]-c[rock]-b[big]",
      probability_expression = "vulcanus_rock_big"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "stone", amount_min = 0, amount_max = 4},
        {type = "item", name = "vaterite", amount_min = 1, amount_max = 2},
        {type = "item", name = "iron-ore", amount_min = 5, amount_max = 11},
        {type = "item", name = "copper-ore", amount_min = 5, amount_max = 11},
        {type = "item", name = "sulfur", amount_min = 2, amount_max = 8}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-01.png",
        width =  188 ,
        height =  127 ,
        shift = {0.304688, -0.4},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-02.png",
        width =  195 ,
        height =  135 ,
        shift = {0.0, 0.0390625},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-03.png",
        width =  205 ,
        height =  132 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-04.png",
        width =  144 ,
        height =  142 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-05.png",
        width =  130 ,
        height =  107 ,
        shift = {0.390625, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-06.png",
        width =  165 ,
        height =  109 ,
        shift = {0.328125, 0.0703125},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-07.png",
        width =  150 ,
        height =  133 ,
        shift = {0.16875, -0.1},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-08.png",
        width =  156 ,
        height =  111 ,
        shift = {0.3, -0.2},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-09.png",
        width =  187 ,
        height =  120 ,
        shift = {0.0, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-10.png",
        width =  225 ,
        height =  128 ,
        shift = {0.1, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-11.png",
        width =  183 ,
        height =  144 ,
        shift = {0.325, -0.1},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-12.png",
        width =  158 ,
        height =  138 ,
        shift = {0.453125, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-13.png",
        width =  188 ,
        height =  150 ,
        shift = {0.539062, -0.015625},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-14.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0703125, 0.179688},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-15.png",
        width =  181 ,
        height =  174 ,
        shift = {0.160938, 0.0},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-16.png",
        width =  212 ,
        height =  150 ,
        shift = {0.242188, -0.195312},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-17.png",
        width =  155 ,
        height =  117 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-18.png",
        width =  141 ,
        height =  128 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-19.png",
        width =  176 ,
        height =  114 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-20.png",
        width =  120 ,
        height =  125 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tungsten_rock_tint
      }
    }
  },
})