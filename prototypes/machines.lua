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
local status_colors_electrochem = {
    idle = {r = 1, g = 0, b = 0, a = 1},
    full_output = {r = 1, g = 1, b = 0, a = 1},
    disabled = {r = 0, g = 1, b = 1, a = 1},
    insufficient_input = {r = 1, g = 0, b = 0, a = 1},
    working = {r = 0, g = 1, b = 0, a = 1},
    low_power = { r = 1, g = 0.5, b = 0, a = 1},
    no_power = { r = 0, g = 0, b = 0, a = 0},
    no_minable_resources = { r = 1, g = 0, b = 0, a = 1}
}
local ECP_pipe_picture =
  {
    north =
    {
      layers =
      {
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-pipe-connections-n",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {0, 3}
        }),
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-shadow-n",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {0,3}
        }),
      },
    },
    east =
    {
      layers =
      {
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-pipe-connections-e",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {-3, 0}
        }),
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-shadow-e",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {-3,0}
        })
      }
    },
    south =
    {
      layers =
      {
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-pipe-connections-s",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {0, -3}
        }),
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-shadow-s",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {0,-3}
        }),
      }
    },
    west =
    {
      layers =
      {
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-pipe-connections-w",
        {
          priority = "extra-high",
          scale = 0.5,
          shift = {3, 0}
        }),
        util.sprite_load("__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-shadow-w",
        {
          priority = "extra-high",
          draw_as_shadow = true,
          scale = 0.5,
          shift = {3,0}
        }),
      }
    }
  }


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
    type = "item",
    name = "cryovolcanic-turbine",
    subgroup = "energy",
    order = "f[nuclear-energy]-c[cryovolcanic-turbine]" ,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    icon = "__Paracelsin-Graphics__/graphics/icons/cryovolcanic-turbine.png",
    icon_size = 64,
    stack_size = 10,
    default_import_location = "paracelsin",
    weight = 200000,
    place_result = "cryovolcanic-turbine"
},
{
    type = "item",
    name = "burner-pumpjack",
    subgroup = "extraction-machine",
    order = "b[fluids]-c",
    inventory_move_sound = item_sounds.pumpjack_inventory_move,
    pick_sound = item_sounds.pumpjack_inventory_pickup,
    drop_sound = item_sounds.pumpjack_inventory_move,
    icon = "__Paracelsin-Graphics__/graphics/icons/burner-pumpjack.png",
    icon_size = 64,
    stack_size = 20,
    default_import_location = "paracelsin",
    weight = 50000,
    place_result = "burner-pumpjack"
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
    type = "recipe",
    name = "cryovolcanic-turbine",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 20},
        {type = "item", name = "steam-turbine", amount = 1},
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "copper-cable", amount = 10},
    },
    results = {
        {type = "item", name = "cryovolcanic-turbine", amount = 1}
    },
    allow_productivity = false,
    main_product = "cryovolcanic-turbine",
    category = "pressing",
    auto_recycle = true
},
{
    type = "recipe",
    name = "burner-pumpjack",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type = "item", name = "steel-plate", amount = 5},
      {type = "item", name = "iron-gear-wheel", amount = 15},
      {type = "item", name = "engine-unit", amount = 2},
      {type = "item", name = "pipe", amount = 5}
    },
    results = {
        {type = "item", name = "burner-pumpjack", amount = 1}
    },
    allow_productivity = false,
    main_product = "burner-pumpjack",
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
			always_draw_covers = false,
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-2, 2} }}
          },
          {
            production_type = "input",
            pipe_picture =  ECP_pipe_picture,
            always_draw_covers = false, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 2} }}
          },
          {
            production_type = "input",
			always_draw_covers = false,
            pipe_covers = pipecoverspictures(),
            volume = 1000,
            pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {2, 2} }}
          },
          {
            production_type = "output",
			always_draw_covers = false,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-2, -2} }}
          },
          {
            production_type = "output",
            pipe_picture =  ECP_pipe_picture,
            always_draw_covers = false, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -2} }}
          },
          {
            production_type = "output",
			always_draw_covers = false,
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
		perceived_performance = {minimum = 0.25, maximum = 8},
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
		  status_colors = status_colors_electrochem,
          animation = {
              layers = {
                  {
                      filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-shadow.png",
                      priority = "high",
                      width = 600,
                      height = 500,
					  shift = util.by_pixel( 3.5, 0.0),
                      frame_count = 1,
                      line_length = 1,
                      repeat_count = 64,
                      animation_speed = 1,
                      draw_as_shadow = true,
                      scale = 0.5
                  },
                  {
                      priority = "high",
                      width = 400,
                      height = 400,
					  shift = util.by_pixel( 3.5, 0.0),
                      frame_count = 64,
                      lines_per_file = 8,
                      animation_speed = 1,
                      scale = 0.425,
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
				  
                  fadeout = false,
				  apply_tint = "status",
				  always_draw = true,
                  animation = {
                      layers = {
                          {
							  
                              priority = "high",
                              draw_as_glow = true,
                              blend_mode = "additive",
                              width = 340,
                              height = 340,
							  shift = util.by_pixel( 3.5, 0.0),
                              frame_count = 64,
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
                          }
                      }
                  }
              },
			  {
				fadeout = false,
				animation = {
                      layers = {
						  {
                              priority = "high",
                              draw_as_glow = true,
                              blend_mode = "additive",
                              width = 340,
                              height = 340,
							  shift = util.by_pixel( 3.5, 0.0),
                              frame_count = 64,
                              lines_per_file = 8,
                              animation_speed = 1,
                              scale = 0.5,
                              stripes = {
                                  {
                                      filename = "__Paracelsin-Graphics__/graphics/entity/electrochemical-plant/electrochemical-plant-emission-2.png",
                                      width_in_frames = 8,
                                      height_in_frames = 8
                                  },
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
      {
    type = "generator",
    name = "cryovolcanic-turbine",
    icon = "__Paracelsin-Graphics__/graphics/icons/cryovolcanic-turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "cryovolcanic-turbine"},
    max_health = 300,
    corpse = "small-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 5,
    fluid_usage_per_tick = 0.25,
    burns_fluid = false,
    maximum_temperature = 30,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    max_power_output= "80kW",
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.south, position = {0, 1} },
        { flow_direction = "input-output", direction = defines.direction.north, position = {0, -1} },
        { flow_direction = "input-output", direction = defines.direction.east, position = {1, 0} },
        { flow_direction = "input-output", direction = defines.direction.west, position = {-1, -0} }
      },
      production_type = "input",
      filter = "water",
      minimum_temperature = 15
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers = {
              {
                filename = "__Paracelsin-Graphics__/graphics/entity/cryovolcanic-turbine/cryovolcanic-turbine-shadow.png",
                size = {400, 350},
                shift = util.by_pixel(0, -16),
                scale = 0.5,
                line_length = 1,
                frame_count = 1,
                repeat_count = 60,
                draw_as_shadow = true,
                animation_speed = 1,
              },
              {
                filename = "__Paracelsin-Graphics__/graphics/entity/cryovolcanic-turbine/cryovolcanic-turbine-animation.png",
                size = {210, 280},
                shift = util.by_pixel(0, -16),
                scale = 0.5,
                line_length = 10,
                lines_per_file = 6,
                frame_count = 60,
                animation_speed = 1,
              },
            },
          },
    vertical_animation =
    {
     layers = {
              {
                filename = "__Paracelsin-Graphics__/graphics/entity/cryovolcanic-turbine/cryovolcanic-turbine-shadow.png",
                size = {400, 350},
                shift = util.by_pixel(0, -16),
                scale = 0.5,
                line_length = 1,
                frame_count = 1,
                repeat_count = 60,
                draw_as_shadow = true,
                animation_speed = 1,
              },
              {
                filename = "__Paracelsin-Graphics__/graphics/entity/cryovolcanic-turbine/cryovolcanic-turbine-animation.png",
                size = {210, 280},
                shift = util.by_pixel(0, -16),
                scale = 0.5,
                line_length = 10,
                lines_per_file = 6,
                frame_count = 60,
                animation_speed = 1,
              },
            },
    },
    impact_category = "metal-large",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-turbine.ogg",
        volume = 0.5,
        modifiers = volume_multiplier("main-menu", 0.7),
        speed_smoothing_window_size = 60,
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.8,
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 5300,
        max = 5300
      }
    },
  },
    {
    type = "mining-drill",
    name = "burner-pumpjack",
    icon = "__Paracelsin-Graphics__/graphics/icons/burner-pumpjack.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "burner-pumpjack"},
    resource_categories = {"basic-fluid"},
    max_health = 200,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    energy_usage = "150kW",
    energy_source =
        {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            emissions_per_minute = { pollution = 50 },
            effectivity = 0.01,
        },
    output_fluid_box =
    {
      volume = 1000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          direction = defines.direction.north,
          positions = {{1, -1}, {1, -1}, {-1, 1}, {-1, 1}},
          flow_direction = "output"
        }
      }
    },
    mining_speed = 5,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 0,
    radius_visualisation_picture =
    {
      filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {78, 173, 255},
    base_render_layer = "object",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-base.png",
          priority = "extra-high",
          width = 261,
          height = 273,
          shift = util.by_pixel(-2.25, -4.75),
          scale = 0.5,
        },
        {
          filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-base-shadow.png",
          width = 220,
          height = 220,
          scale = 0.5,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5)
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-horsehead.png",
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24),
            },
            {
              priority = "high",
              filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-horsehead-shadow.png",
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      }
    },
    open_sound = {filename = "__base__/sound/open-close/pumpjack-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/pumpjack-close.ogg", volume = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.7, audible_distance_modifier = 0.6},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },
    fast_replaceable_group = "pumpjack",

    circuit_connector = circuit_connector_definitions["pumpjack"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
  }