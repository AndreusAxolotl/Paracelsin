require ("util")
require("__base__/prototypes/entity/pipecovers")
require ("circuit-connector-sprites")
local assembler_pictures = require("__base__.prototypes.entity.assembler-pictures")
local pipe_picture = assembler_pictures.assembler3pipepictures
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

local function pumpjack_animation()
  return
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
          shift = util.by_pixel(-4.5, -29)
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
end

local function pumpjack_visualisations(flipped)
  local base_sheets =
  {
    {
      filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-base" .. (flipped and "-flipped" or "") .. ".png",
      priority = "extra-high",
      width = 261,
      height = 273,
      shift = util.by_pixel(-2.25, -4.75),
      scale = 0.5
    },
    {
      filename = "__Paracelsin-Graphics__/graphics/entity/burner-pumpjack/burner-pumpjack-base" .. (flipped and "-flipped" or "") .. "-shadow.png",
      width = 220,
      height = 220,
      scale = 0.5,
      draw_as_shadow = true,
      shift = util.by_pixel(-2, -5)
    }
  }

  local base_visualisation = {always_draw = true, secondary_draw_order = -1}
  for i, name in pairs{"north_animation", "east_animation", "south_animation", "west_animation"} do
    local layers = {}
    for _, sheet in pairs(base_sheets) do
      sheet = table.deepcopy(sheet)
      sheet.x = sheet.width * (i - 1)
      table.insert(layers, sheet)
    end
    base_visualisation[name] = {layers = layers}
  end
  return {base_visualisation}
end


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
circuit_connector_definitions["crusher"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 18, main_offset = util.by_pixel( 14, 23), shadow_offset = util.by_pixel( 14, 28), show_shadow = true },
    { variation = 16, main_offset = util.by_pixel(-36,  5), shadow_offset = util.by_pixel(-33,  7), show_shadow = false },
    { variation = 18, main_offset = util.by_pixel( 14, 23), shadow_offset = util.by_pixel( 14, 28), show_shadow = true },
    { variation = 16, main_offset = util.by_pixel(-36,  5), shadow_offset = util.by_pixel(-33,  7), show_shadow = false }
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
    type = "recipe-category",
    name = "macerating",
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
    name = "pressure-turbine",
    subgroup = "energy",
    order = "f[nuclear-energy]-c[pressure-turbine]" ,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    icon = "__Paracelsin-Graphics__/graphics/icons/pressure-turbine.png",
    icon_size = 64,
    stack_size = 10,
    default_import_location = "paracelsin",
    weight = 200000,
    place_result = "pressure-turbine"
},
  {
    type = "item",
    name = "macerator",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/crusher.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    subgroup = "smelting-machine",
    order = "d-b",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "macerator",
    stack_size = 5,
    weight = 50000
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
    categories = {"crafting", "metallurgy", "mechanics"},
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
    categories = {"crafting", "metallurgy", "mechanics"},
    auto_recycle = true
},
{
    type = "recipe",
    name = "pressure-turbine",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 15},
        {type = "item", name = "engine-unit", amount = 2},
        {type = "item", name = "steel-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 10},
    },
    results = {
        {type = "item", name = "pressure-turbine", amount = 1}
    },
    allow_productivity = false,
    main_product = "pressure-turbine",
    categories = {"crafting", "metallurgy", "mechanics"},
    auto_recycle = true
},
  {
    type = "recipe",
    name = "macerator",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "low-density-structure", amount = 20},
      {type = "item", name = "galvanized-steel-plate", amount = 5},
      {type = "item", name = "electric-coil", amount = 10}
    },
    energy_required = 20,
    results = {{type="item", name="macerator", amount=1}},
    categories = {"crafting", "metallurgy", "mechanics"},
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
        use_mirroring = true,
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
        crafting_categories = {"mechanics"},
        use_mirroring = true,
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
    type = "mining-drill",
    name = "pressure-turbine",
    icon = "__Paracelsin-Graphics__/graphics/icons/pressure-turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "pressure-turbine"},
    max_health = 300,
    corpse = "small-remnants",
    dying_explosion = "medium-explosion",
    resource_categories = {"gas-vents"},
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
    max_power_output= "200kW",
    output_fluid_box =
    {
      volume = 1000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
         { flow_direction = "output", direction = defines.direction.south, position = {0, 1} },
        { flow_direction = "output", direction = defines.direction.north, position = {0, -1} },
        { flow_direction = "output", direction = defines.direction.east, position = {1, 0} },
        { flow_direction = "output", direction = defines.direction.west, position = {-1, -0} }
      }
    },
    energy_source =
    {
      type = "void",
    },
    energy_usage = "1kW",
    mining_speed = 0.25,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 0,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    migrate_horizontal_mirroring = true,
    use_mirroring = true,
    graphics_set =
    {
        animation = {
          north =
    {
      layers = {
              {
                filename = "__Paracelsin-Graphics__/graphics/entity/pressure-turbine/pressure-turbine-shadow.png",
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
                filename = "__Paracelsin-Graphics__/graphics/entity/pressure-turbine/pressure-turbine-animation.png",
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
        },
working_visualisations = {{
                filename = "__Paracelsin-Graphics__/graphics/entity/pressure-turbine/pressure-turbine-shadow.png",
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
                filename = "__Paracelsin-Graphics__/graphics/entity/pressure-turbine/pressure-turbine-animation.png",
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
    circuit_connector = circuit_connector_definitions["pumpjack"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {
    type = "electric-energy-interface",
    name = "pressure-turbine-energy-interface",
    icon = "__Paracelsin-Graphics__/graphics/icons/pressure-turbine.png",
    localised_name = {"entity-name.pressure-turbine"},
    localised_description = {"entity-description.pressure-turbine"},
    flags = {"not-on-map", "not-blueprintable", "not-repairable", "not-selectable-in-game", "not-upgradable", "not-flammable", "hide-alt-info", "not-deconstructable", "not-in-kill-statistics", "no-copy-paste"},
    hidden = true,
    max_health = 150,
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selectable_in_game = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1MW",
      usage_priority = "tertiary",
      input_flow_limit = "0kW",
      output_flow_limit = "5.8MW"
    },
    energy_production = "5.8MW",
    energy_usage = "0kW",
    picture =
    {
      filename = "__core__/graphics/empty.png",
      priority = "extra-high",
      width = 1,
      height = 1
    },
    order = "h-e-e-i"
  },
  {
    type = "furnace",
    name = "macerator",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/crusher.png",
        icon_size = 64,
        tint = { r = 0.7, g = 0.87, b = 0.79, a = 1 }
      },
    },
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "macerator"},
    fast_replaceable_group = "crusher",
    max_health = 500,
    corpse = "crusher-remnants",
    dying_explosion = "electric-furnace-explosion",
    circuit_wire_max_distance = 9,
    circuit_connector = circuit_connector_definitions["crusher"],
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    surface_conditions =
    {
      {
        property = "gravity",
        min = 1
      }
    },
    selection_box = {{-1, -1.5}, {1, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 2,
    icon_draw_specification = {shift = {0, -0.45}},
    allowed_effects = {"speed", "consumption", "pollution"},
    quality_affects_module_slots = true,
    crafting_machine_module_slots_bonus = 1,
    crafting_categories = {"macerating"},
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 0,
    energy_usage = "2.5MW",
    heating_energy = "300kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 20 }
    },
    open_sound = sounds.mech_small_open,
    close_sound = sounds.mech_small_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/crusher/crusher-loop.ogg",
        volume = 0.8,
        audible_distance_modifier = 0.6,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      max_sounds_per_prototype = 3
    },
    graphics_set = require("__Paracelsin__/prototypes/macerator-pictures"),
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/crusher/crusher-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 40-32),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  }
  table.insert(data.raw["utility-constants"]["default"].factoriopedia_recycling_recipe_categories, "macerating")