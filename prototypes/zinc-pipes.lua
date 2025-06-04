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
local function make_visualization(i)
  return
  {
    filename = "__base__/graphics/entity/pipe/visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end
local function make_disabled_visualization(i)
  return
  {
    filename = "__base__/graphics/entity/pipe/disabled-visualization.png",
    priority = "extra-high",
    x = i * 64,
    size = 64,
    scale = 0.5,
    flags = {"icon"},
  }
end

local zincpipepictures = function()
  return
  {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 160,
      height = 160,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
    },
    straight_vertical_single_visualization = make_visualization(0),
    straight_vertical_visualization = make_visualization(5),
    straight_vertical_window_visualization = make_visualization(5),
    straight_horizontal_window_visualization = make_visualization(10),
    straight_horizontal_visualization = make_visualization(10),
    corner_up_right_visualization = make_visualization(3),
    corner_up_left_visualization = make_visualization(9),
    corner_down_right_visualization = make_visualization(6),
    corner_down_left_visualization = make_visualization(12),
    t_up_visualization = make_visualization(11),
    t_down_visualization = make_visualization(14),
    t_right_visualization = make_visualization(7),
    t_left_visualization = make_visualization(13),
    cross_visualization = make_visualization(15),
    ending_up_visualization = make_visualization(1),
    ending_down_visualization = make_visualization(4),
    ending_right_visualization = make_visualization(2),
    ending_left_visualization = make_visualization(8),
    straight_vertical_single_disabled_visualization = make_disabled_visualization(0),
    straight_vertical_disabled_visualization = make_disabled_visualization(5),
    straight_vertical_window_disabled_visualization = make_disabled_visualization(5),
    straight_horizontal_window_disabled_visualization = make_disabled_visualization(10),
    straight_horizontal_disabled_visualization = make_disabled_visualization(10),
    corner_up_right_disabled_visualization = make_disabled_visualization(3),
    corner_up_left_disabled_visualization = make_disabled_visualization(9),
    corner_down_right_disabled_visualization = make_disabled_visualization(6),
    corner_down_left_disabled_visualization = make_disabled_visualization(12),
    t_up_disabled_visualization = make_disabled_visualization(11),
    t_down_disabled_visualization = make_disabled_visualization(14),
    t_right_disabled_visualization = make_disabled_visualization(7),
    t_left_disabled_visualization = make_disabled_visualization(13),
    cross_disabled_visualization = make_disabled_visualization(15),
    ending_up_disabled_visualization = make_disabled_visualization(1),
    ending_down_disabled_visualization = make_disabled_visualization(4),
    ending_right_disabled_visualization = make_disabled_visualization(2),
    ending_left_disabled_visualization = make_disabled_visualization(8),
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 64,
      height = 40,
      scale = 0.5
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    gas_flow =
    {
      filename = "__base__/graphics/entity/pipe/steam.png",
      priority = "extra-high",
      line_length = 10,
      width = 48,
      height = 30,
      frame_count = 60
    }
  }
end

data:extend({
{
    type = "item",
    name = "zinc-pipe",
    icons =
    {
      {
        icon = "__base__/graphics/icons/pipe.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    subgroup = "energy-pipe-distribution",
    order = "y",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "zinc-pipe",
    stack_size = 50,
    weight = 10 * kg,
  },
  {
    type = "item",
    name = "zinc-pipe-to-ground",
     icons =
    {
      {
        icon = "__base__/graphics/icons/pipe-to-ground.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    subgroup = "energy-pipe-distribution",
    order = "z",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "zinc-pipe-to-ground",
    stack_size = 20,
  },
  {
    type = "recipe",
    name = "zinc-pipe",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "zinc-plate",   amount = 4},
        {type = "item", name = "zinc-rivets",       amount = 2},
    },
    results = {
        {type = "item", name = "zinc-pipe", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    category = "mechanics",
    auto_recycle = true
},
{
    type = "recipe",
    name = "zinc-pipe-to-ground",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "zinc-plate",   amount = 10},
        {type = "item", name = "zinc-rivets",       amount = 5},
        {type = "item", name = "zinc-pipe",       amount = 10},
    },
    results = {
        {type = "item", name = "zinc-pipe-to-ground", amount = 2}
    },
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    category = "mechanics",
    auto_recycle = true
},
  {
    type = "pipe",
    name = "zinc-pipe",
    icons =
    {
      {
        icon = "__base__/graphics/icons/pipe.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "zinc-pipe"},
    max_health = 200,
    corpse = "pipe-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 40
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(), -- in case a real pipe is connected to a ghost
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0} },
        { direction = defines.direction.east, position = {0, 0} },
        { direction = defines.direction.south, position = {0, 0} },
        { direction = defines.direction.west, position = {0, 0} }
      },
      hide_connection_info = true
    },
    impact_category = "metal",
    pictures = zincpipepictures(),
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },
 {
    type = "pipe-to-ground",
    name = "zinc-pipe-to-ground",
    icons =
    {
      {
        icon = "__base__/graphics/icons/pipe-to-ground.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "zinc-pipe-to-ground"},
    max_health = 300,
    corpse = "pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    factoriopedia_simulation = simulations.factoriopedia_pipe_to_ground,
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 50
      }

    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0} },
        {
          connection_type = "underground",
          direction = defines.direction.south,
          position = {0, 0},
          max_underground_distance = 20
        }
      },
      hide_connection_info = true
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      }
    },
    visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}

      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
    disabled_visualization =
    {
      north =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/disabled-visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
  }})