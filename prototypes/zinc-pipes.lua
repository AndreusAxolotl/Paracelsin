require ("util")
require("__base__/prototypes/entity/pipecovers")
require ("circuit-connector-sprites")
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

local zincpipecoverspictures = function()
  return
  {
    north =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }
end


data:extend({
  {
    type = "item-subgroup",
    name = "zinc-pipe",
    group = "logistics",
    order = "d-a"
  },
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
    subgroup = "zinc-pipe",
    order = "a",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "zinc-pipe",
    stack_size = 30,
    weight = 100000,
     default_import_location = "paracelsin",
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
    subgroup = "zinc-pipe",
    order = "b",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "zinc-pipe-to-ground",
    stack_size = 10,
    weight = 100000,
     default_import_location = "paracelsin",
  },
    {
    type = "item",
    name = "zinc-storage-tank",
    icons =
    {
      {
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    subgroup = "zinc-pipe",
    order = "c",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "zinc-storage-tank",
    stack_size = 10,
    weight = 1000000,
     default_import_location = "paracelsin",
  },
  {
    type = "item",
    name = "zinc-pump",
    icons =
    {
      {
        icon = "__base__/graphics/icons/pump.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    subgroup = "zinc-pipe",
    order = "d",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "zinc-pump",
    stack_size = 10,
    weight = 1000000,
     default_import_location = "paracelsin",
  },
  {
    type = "recipe",
    name = "zinc-pipe",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "zinc-plate",   amount = 5},
        {type = "item", name = "zinc-rivets",       amount = 5},
        {type = "fluid", name = "molten-iron",       amount = 10},
        {type = "item", name = "galvanized-steel-plate", amount = 1},
    },
    results = {
        {type = "item", name = "zinc-pipe", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    categories = {"mechanics"},
    auto_recycle = true
},
{
    type = "recipe",
    name = "zinc-pipe-to-ground",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "zinc-plate",   amount = 10},
        {type = "item", name = "zinc-rivets",       amount = 10},
        {type = "item", name = "zinc-pipe",       amount = 20},
        {type = "fluid", name = "molten-iron",       amount = 20},
        {type = "item", name = "galvanized-steel-plate", amount = 2},
    },
    results = {
        {type = "item", name = "zinc-pipe-to-ground", amount = 2}
    },
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    categories = {"mechanics"},
    auto_recycle = true
},
{
    type = "recipe",
    name = "zinc-storage-tank",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "zinc-plate",   amount = 20},
        {type = "item", name = "zinc-rivets",       amount = 20},
        {type = "item", name = "zinc-pipe",       amount = 5},
        {type = "fluid", name = "molten-iron",       amount = 30},
        {type = "item", name = "galvanized-steel-plate", amount = 10},
    },
    results = {{type="item", name="zinc-storage-tank", amount=1}},
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    categories = {"mechanics"},
    auto_recycle = true
  },
  {
    type = "recipe",
    name = "zinc-pump",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "zinc-plate",   amount = 15},
      {type = "item", name = "electric-coil",   amount = 10},
      {type = "item", name = "zinc-rivets",       amount = 20},
      {type = "item", name = "zinc-pipe",       amount = 2},
      {type = "fluid", name = "molten-iron",       amount = 25},
      {type = "item", name = "galvanized-steel-plate", amount = 10},
    },
    results = {{type="item", name="zinc-pump", amount=1}},
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    categories = {"mechanics"},
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
      pipe_covers = zincpipecoverspictures(), -- in case a real pipe is connected to a ghost
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0}, hide_connection_info = true },
        { direction = defines.direction.east, position = {0, 0}, hide_connection_info = true },
        { direction = defines.direction.south, position = {0, 0}, hide_connection_info = true },
        { direction = defines.direction.west, position = {0, 0}, hide_connection_info = true }
      }
    },
    circuit_connector = circuit_connector_definitions["pipe"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_fluid_temperature_signal = {type = "virtual", name = "signal-T"},
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
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0}, hide_connection_info = true },
        {
          connection_type = "underground",
          direction = defines.direction.south,
          position = {0, 0},
          max_underground_distance = 20,
          hide_connection_info = true
        }
      },
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    circuit_connector = circuit_connector_definitions["pipe-to-ground"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_fluid_temperature_signal = {type = "virtual", name = "signal-T"},
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
  },
{
    type = "storage-tank",
    name = "zinc-storage-tank",
    icons =
    {
      {
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "zinc-storage-tank"},
    max_health = 1000,
    corpse = "storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "storage-tank",
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = {scale = 1.5, shift = {0, -0.3}},
    fluid_box =
    {
      volume = 50000,
      pipe_covers = zincpipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {-1, -1}, hide_connection_info = true },
        { direction = defines.direction.east, position = {1, 1}, hide_connection_info = true },
        { direction = defines.direction.south, position = {1, 1}, hide_connection_info = true },
        { direction = defines.direction.west, position = {-1, -1}, hide_connection_info = true }
      },
      hide_connection_info = true
    },
    two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 219,
            height = 235,
            shift = util.by_pixel(-0.25, -1.25),
            scale = 0.5,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
          },
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 291,
            height = 153,
            shift = util.by_pixel(29.75, 22.25),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.5
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.5
      }
    },
    flow_length_in_ticks = 360,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = {filename = "__base__/sound/storage-tank.ogg", volume = 0.6, audible_distance_modifier = 0.5},
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3
    },

    circuit_connector = circuit_connector_definitions["storage-tank"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_fluid_temperature_signal = {type = "virtual", name = "signal-T"},
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
{
    type = "pump",
    name = "zinc-pump",
    icons =
    {
      {
        icon = "__base__/graphics/icons/pump.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "zinc-pump"},
    max_health = 400,
    fast_replaceable_group = "pipe",
    corpse = "pump-remnants",
    dying_explosion = "pump-explosion",
    collision_box = {{-0.29, -0.9}, {0.29, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    icon_draw_specification = {scale = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pump.ogg", volume = 0.3, audible_distance_modifier = 0.5},
      max_sounds_per_prototype = 2
    },
    damaged_trigger_effect = hit_effects.entity(),
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
    fluid_box =
    {
      volume = 800,
      pipe_covers = zincpipecoverspictures(),
       pipe_connections =
      {
        { direction = defines.direction.north, position = {0, -0.5}, flow_direction = "output" },
        { direction = defines.direction.south, position = {0, 0.5}, flow_direction = "input", hide_connection_info = true }
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "10kW"
    },
    energy_usage = "100kW",
    pumping_speed = 40,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    animations =
    {
      north =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/pump/pump-north.png",
            width = 103,
            height = 164,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
            shift = util.by_pixel(8, -0.85),
          },
          {
            filename = "__base__/graphics/entity/pump/pump-north-shadow.png",
            width = 103,
            height = 164,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            shift = util.by_pixel(8, -0.85),
            draw_as_shadow = true,
          },
        }
      },
      east =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/pump/pump-east.png",
            width = 130,
            height = 109,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
            shift = util.by_pixel(-0.5, 1.75)
          },
          {
            filename = "__base__/graphics/entity/pump/pump-east-shadow.png",
            width = 130,
            height = 109,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            shift = util.by_pixel(-0.5, 1.75),
            draw_as_shadow = true,
          },
        }
      },
      south =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/pump/pump-south.png",
            width = 114,
            height = 160,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
            shift = util.by_pixel(12.5, -8)
          },
          {
            filename = "__base__/graphics/entity/pump/pump-south-shadow.png",
            width = 114,
            height = 160,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            shift = util.by_pixel(12.5, -8),
            draw_as_shadow = true,
          },
        }
      },
      west =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/pump/pump-west.png",
            width = 131,
            height = 111,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
            shift = util.by_pixel(-0.25, 1.25)
          },
          {
            filename = "__base__/graphics/entity/pump/pump-west-shadow.png",
            width = 131,
            height = 111,
            scale = 0.5,
            line_length =8,
            frame_count =32,
            animation_speed = 0.5,
            shift = util.by_pixel(-0.25, 1.25),
            draw_as_shadow = true,
          },
        }
      },
    },
    wagon_connection_graphics = {
  base_animation_finished_at_progress = 0.5,
  clamp_animation_starts_at_progress = 0.75,
  part_1 = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_1",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
      }),
  part_1_shadow = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_1_shadow",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
        draw_as_shadow = true,
      }),
  part_2 = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_2",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
      }),
  part_2_shadow = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_2_shadow",
      {
        direction_count = 128,
        scale = 0.5,
        priority = "very-low",
        draw_as_shadow = true,
      }),
  suction_clamp =util.sprite_load( "__base__/graphics/entity/pump/connector/Part_3",
      {
        frame_count = 8,
        scale = 0.5,
        animation_speed = 1,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
      }),
  suction_clamp_shadow = util.sprite_load( "__base__/graphics/entity/pump/connector/Part_3_shadow",
      {
        frame_count = 8,
        scale = 0.5,
        animation_speed = 1,
        draw_as_shadow = true,
      }),
  base =
  {
    input =
    {
      north =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      east =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      south =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      west =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_input",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      }
    },
    output =
    {
      north =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_North_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      east =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_East_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      south =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_South_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      },
      west =
      {
        layers =
        {
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_output",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 },
          }),
          util.sprite_load( "__base__/graphics/entity/pump/connector/Base/Base_West_shadow",
          {
            frame_count = 20,
            scale = 0.5,
            animation_speed = 1,
            draw_as_shadow = true,
          }),
        }
      }
    }
  },
  height_diff_to_wagon = 0.15,
  part1_to_2_shift = { 0, 0 },
  part2_crop_adjustment = -0.05,
  part2_shadow_crop_adjustment = -0.05,
  clamp_y_shift = -0.375,
  top_pivot_shift =
  {
    north = { 0, -2.4 },
    east = { 1.185, -1.4 },
    south = { 0, -0.8 },
    west = { -1.2, -1.4 },
  },
  resting_position_shift =
  {
    north = { 0, -0.6 },
    east = { 0.75, -0.05 },
    south = { 0, 0.5 },
    west = { -0.7, -0.05 },
  },
  shadow_shift = { 0.8, 1.55 },
},
    fluid_wagon_tank_valve_max_distance = 2.22,

    base_lifting_sound =
    {
      sound =
      {
        filename = "__base__/sound/entity/pump/pump-base-lift-loop.ogg",
        volume = 0.6,
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
        },
        aggregation = {max_count = 1, remove = true, count_already_playing = true},
      },
    },

    arm_orienting_sound =
    {
      sound =
      {
        filename = "__base__/sound/entity/pump/pump-arm-orient-loop.ogg",
        volume = 0.8,
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
        },
        aggregation = {max_count = 1, remove = true, count_already_playing = true},
      },
    },

    clamp_sound =
    {
      filename = "__base__/sound/entity/pump/pump-clamp.ogg",
      volume = 0.6,
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
      },
      aggregation = {max_count = 1, remove = true, count_already_playing = true},
    },

    fluid_animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 38,
        height = 22,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-0.250, -16.750)
      },

      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
        width = 35,
        height = 46,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(6.25, -8.5)
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 38,
        height = 45,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(0.5, -9.25)
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 35,
        height = 47,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.5, -9.5)
      }
    },

    glass_pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(-16, 0)
      }
    },

    circuit_connector = circuit_connector_definitions["pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },})