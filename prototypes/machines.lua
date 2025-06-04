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

circuit_connector_definitions["electrochemical-plant"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 28, main_offset = util.by_pixel( 71.625,  7), shadow_offset = util.by_pixel( 71.625,  7), show_shadow = true }, 
    { variation = 28, main_offset = util.by_pixel( 71.625,  7), shadow_offset = util.by_pixel( 71.625,  7), show_shadow = true }, 
    { variation = 28, main_offset = util.by_pixel( 71.625,  7), shadow_offset = util.by_pixel( 71.625,  7), show_shadow = true }, 
    { variation = 28, main_offset = util.by_pixel( 71.625,  7), shadow_offset = util.by_pixel( 71.625,  7), show_shadow = true }, 
  }
)
circuit_connector_definitions["mechanical-plant"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel(-43.75,  18.25), shadow_offset = util.by_pixel(-43.75,  18.25), show_shadow = true }, 
    { variation = 17, main_offset = util.by_pixel(-43.75,  18.25), shadow_offset = util.by_pixel(-43.75,  18.25), show_shadow = true }, 
    { variation = 17, main_offset = util.by_pixel(-43.75,  18.25), shadow_offset = util.by_pixel(-43.75,  18.25), show_shadow = true }, 
    { variation = 17, main_offset = util.by_pixel(-43.75,  18.25), shadow_offset = util.by_pixel(-43.75,  18.25), show_shadow = true }, 
  }
)

data:extend{
    {
    type = "recipe-category",
    name = "electrochemistry",
  },
  {
    type = "recipe-category",
    name = "mechanics",
  },
  {
    type = "item",
    name = "electrochemical-plant",
    subgroup = "production-machine",
    order = "z",
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    icon = "__Paracelsin-Graphics__/graphics/icons/electrochemical-plant.png",
    icon_size = 64,
    stack_size = 10,
    default_import_location = "paracelsin",
    weight = 200000,
    place_result = "electrochemical-plant"
},
  {
    type = "item",
    name = "mechanical-plant",
    subgroup = "production-machine",
    order = "z",
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    icon = "__Paracelsin-Graphics__/graphics/icons/mechanical-plant.png",
    icon_size = 64,
    stack_size = 10,
    default_import_location = "paracelsin",
    weight = 200000,
    place_result = "mechanical-plant"
},
{
    type = "recipe",
    name = "electrochemical-plant",
    enabled = false,
    energy_required = 30,
    ingredients = {
        {type = "item", name = "processing-unit",   amount = 30},
        {type = "item", name = "zinc-solder",       amount = 20},
        {type = "item", name = "tungsten-plate", amount = 25},
        {type = "item", name = "copper-cable", amount = 20},
    },
    results = {
        {type = "item", name = "electrochemical-plant", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    main_product = "electrochemical-plant",
    category = "pressing",
    auto_recycle = true
},
{
    type = "recipe",
    name = "mechanical-plant",
    enabled = false,
    energy_required = 30,
    ingredients = {
        {type = "item", name = "processing-unit",   amount = 30},
        {type = "item", name = "zinc-rivets",       amount = 20},
        {type = "item", name = "tungsten-carbide", amount = 25},
        {type = "item", name = "iron-gear-wheel", amount = 20},
    },
    results = {
        {type = "item", name = "mechanical-plant", amount = 1}
    },
    allow_productivity = false,
    surface_conditions = {{property = "pressure", min = 5300, max = 5300}},
    main_product = "mechanical-plant",
    category = "pressing",
    auto_recycle = true
},
    {
        name = "electrochemical-plant",
        type = "assembling-machine",
        icon = "__Paracelsin-Graphics__/graphics/icons/electrochemical-plant.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
          mining_time = 0.5,
          results = {{type="item", name="electrochemical-plant", amount=1}}
        },
        max_health = 400,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["electrochemical-plant"],
        collision_box = {{-2.1, -2.1}, {2.1, 2.1}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        crafting_categories = {"electrochemistry", "chemistry"},
        fluid_boxes =
        {
          {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-2, 2} }}
          },
          {
            production_type = "input",
            pipe_picture =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
            always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 2} }}
          },
          {
            production_type = "input",
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {2, 2} }}
          },
          {
            production_type = "output",
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-2, -2} }}
          },
          {
            production_type = "output",
            pipe_picture =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
            always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -2} }}
          },
          {
            production_type = "output",
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {2, -2} }}
          }
      },
        fluid_boxes_off_when_no_fluid_recipe = true,
        crafting_speed = 2.5,
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input",
          emissions_per_minute = { pollution = 10 },
          drain = "200kW",
        },
        impact_category = "metal",
        open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
        close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
        energy_usage = "4MW",
        heating_energy = "350kW",
        module_slots = 4,
        source_inventory_size = 1,
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        effect_receiver = {
          base_effect = {
            productivity = 0.25
          }
        },
        graphics_set = {
          animation = {
              layers = {
                  {
                      filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-shadow.png",
                      priority = "high",
                      width = 600,
                      height = 500,
                      frame_count = 1,
                      line_length = 1,
                      repeat_count = 32,
                      animation_speed = 1,
                      draw_as_shadow = true,
                      scale = 0.5
                  },
                  {
                      priority = "high",
                      width = 340,
                      height = 340,
                      frame_count = 32,
                      lines_per_file = 8,
                      animation_speed = 1,
                      scale = 0.5,
                      stripes = {
                          {
                              filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-animation.png",
                              width_in_frames = 8,
                              height_in_frames = 8
                          }
                      }
                  },
              }
          },
          working_visualisations = {
              {
                  fadeout = true,
                  animation = {
                      layers = {
                          {
                              priority = "high",
                              width = 340,
                              height = 340,
                              frame_count = 32,
                              lines_per_file = 8,
                              animation_speed = 1,
                              scale = 0.5,
                              stripes = {
                                  {
                                      filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-animation.png",
                                      width_in_frames = 8,
                                      height_in_frames = 8
                                  }
                              }
                          },
                          {
                              priority = "high",
                              draw_as_glow = true,
                              blend_mode = "additive",
                              width = 340,
                              height = 340,
                              frame_count = 32,
                              lines_per_file = 8,
                              animation_speed = 1,
                              scale = 0.5,
                              stripes = {
                                  {
                                      filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-emission-1.png",
                                      width_in_frames = 8,
                                      height_in_frames = 8
                                  },
                              }
                          },
                          {
                              priority = "high",
                              draw_as_glow = true,
                              blend_mode = "additive",
                              width = 340,
                              height = 340,
                              frame_count = 32,
                              lines_per_file = 8,
                              animation_speed = 1,
                              scale = 0.5,
                              stripes = {
                                  {
                                      filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-emission-2.png",
                                      width_in_frames = 8,
                                      height_in_frames = 8
                                  }
                              }
                          }
                      }
                  }
              }
          }
      },
        working_sound =
        {
          sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.65},
          apparent_volume = 0.3,
        },
        created_effect = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              {
                type = "script",
                effect_id = "electrochemical-plant-created",
              },
            }
          }
        },
      },
      {
        name = "mechanical-plant",
        type = "assembling-machine",
        icon = "__Paracelsin-Graphics__/graphics/icons/mechanical-plant.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
          mining_time = 0.5,
          results = {{type="item", name="mechanical-plant", amount=1}}
        },
        max_health = 400,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions["mechanical-plant"],
        collision_box = {{-1.6, -1.6}, {1.6, 1.6}},
        selection_box = {{-2, -2}, {2, 2}},
        crafting_categories = {"mechanics", "pressing"},
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = {{direction = defines.direction.south, flow_direction = "input-output", position = {-0.5, 1.5}}},
                secondary_draw_orders = {north = -1},
            },
            {
                production_type = "output",
                pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = {{direction = defines.direction.east, flow_direction = "input-output", position = {1.5, -0.5}}},
                secondary_draw_orders = {north = -1},
            },
            {
                production_type = "input",
                pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = {{direction = defines.direction.north, flow_direction = "input-output", position = {0.5, -1.5}}},
                secondary_draw_orders = {north = -1},
            },
            {
                production_type = "output",
                pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
                pipe_covers = pipecoverspictures(),
                volume = 100,
                pipe_connections = {{direction = defines.direction.west, flow_direction = "input-output", position = {-1.5, 0.5}}},
                secondary_draw_orders = {north = -1},
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        crafting_speed = 2,
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input",
          emissions_per_minute = { pollution = 8 },
          drain = "50kW",
        },
        impact_category = "metal",
        open_sound = sounds.metal_large_open,
        close_sound = sounds.metal_large_close,
        energy_usage = "2.5MW",
        heating_energy = "300kW",
        module_slots = 4,
        source_inventory_size = 1,
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        effect_receiver = {
          base_effect = {
            productivity = 0.5
          }
        },
        graphics_set = {
          animation = {
              layers = {
                  {
                      filename = "__Paracelsin-Graphics__/graphics/entity/mechanical-plant/mechanical-plant-shadow.png",
                      priority = "high",
                      width = 500,
                      height = 350,
                      frame_count = 1,
                      line_length = 1,
                      repeat_count = 64,
                      animation_speed = 1,
                      draw_as_shadow = true,
                      scale = 0.5,
                  },
                  {
                      priority = "high",
                      width = 270,
                      height = 310,
                      frame_count = 64,
                      lines_per_file = 8,
                      animation_speed = 1,
                      scale = 0.5,
                      stripes = {
                          {
                              filename = "__Paracelsin-Graphics__/graphics/entity/mechanical-plant/mechanical-plant-animation.png",
                              width_in_frames = 8,
                              height_in_frames = 8
                          }
                      }
                  },
              }
          },       
          working_visualisations = {
              {
                  fadeout = true,
                  animation = {
                      layers = {
                          {
                              priority = "high",
                              width = 270,
                              height = 310,
                              frame_count = 64,
                              lines_per_file = 8,
                              animation_speed = 1,
                              scale = 0.5,
                              stripes = {
                                  {
                                      filename = "__Paracelsin-Graphics__/graphics/entity/mechanical-plant/mechanical-plant-animation.png",
                                      width_in_frames = 8,
                                      height_in_frames = 8
                                  }
                              }
                          },
                          {
                              priority = "high",
                              draw_as_glow = true,
                              blend_mode = "additive",
                              width = 270,
                              height = 310,
                              frame_count = 64,
                              lines_per_file = 8,
                              animation_speed = 1,
                              scale = 0.5,
                              stripes = {
                                  {
                                      filename = "__Paracelsin-Graphics__/graphics/entity/mechanical-plant/mechanical-plant-emission.png",
                                      width_in_frames = 8,
                                      height_in_frames = 8
                                  }
                              }
                          }
                      }
                  }
              }
          }
      },
        working_sound =
        {
          sound = {filename = "__space-age__/sound/entity/electromagnetic-plant/electromagnetic-plant-loop.ogg", volume = 0.5},
          apparent_volume = 0.3,
        },
        created_effect = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              {
                type = "script",
                effect_id = "mechanical-plant-created",
              },
            }
          }
        },
      },
}