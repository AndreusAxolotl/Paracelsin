require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local asteroid_util = require("prototypes.asteroid-spawn-definitions")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

data:extend(
{
  {
    type = "autoplace-control",
    name = "sphalerite",
    localised_name = {"", "[entity=sphalerite] ", {"entity-name.sphalerite"}},
    richness = true,
    order = "z-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "tetrahedrite",
    localised_name = {"", "[entity=tetrahedrite] ", {"entity-name.tetrahedrite"}},
    richness = true,
    order = "z-d",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "vaterite",
    localised_name = {"", "[entity=vaterite] ", {"entity-name.vaterite"}},
    richness = true,
    order = "z-c",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "water_cryovolcano",
    localised_name = {"", "[entity=water-cryovolcano] ", {"entity-name.water-cryovolcano"}},
    richness = true,
    order = "z-d",
    category = "resource"
  },
  {
        type = "autoplace-control",
        name = "big_metallic_rock",
        order = "z-e",
        category = "terrain",
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "crashed_fulgoran_pod",
        order = "z-f",
        category = "terrain",
        can_be_disabled = false,
    },
{
    type = "noise-expression",
    name = "paracelsin_starting_sphalerite",
    expression = "starting_spot_at_angle{ angle = vulcanus_ashlands_angle + 15 * vulcanus_starting_direction,\z
                                          distance = 180 * vulcanus_starting_area_radius,\z
                                          radius = 30 * paracelsin_sphalerite_size,\z
                                          x_distortion = 0.5 * vulcanus_resource_wobble_x,\z
                                          y_distortion = 0.5 * vulcanus_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "paracelsin_starting_tetrahedrite",
    expression = "starting_spot_at_angle{ angle = vulcanus_mountains_angle - 20 * vulcanus_starting_direction,\z
                                          distance = 350 * vulcanus_starting_area_radius,\z
                                          radius = 35 / 1.5 * paracelsin_tetrahedrite_size,\z
                                          x_distortion = 0.5 * vulcanus_resource_wobble_x,\z
                                          y_distortion = 0.5 * vulcanus_resource_wobble_y}"
  },
    {
    type = "noise-expression",
    name = "paracelsin_starting_water_cryovolcano",
    expression = "starting_spot_at_angle{angle = aquilo_angle, distance = 40, radius = aquilo_spot_size * 0.8, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "paracelsin_water_cryovolcano_spots",
    expression = "aquilo_spot_noise{seed = 567,\z
                                    count = 4,\z
                                    skip_offset = 0,\z
                                    region_size = 600 + 400 / control:water_cryovolcano:frequency,\z
                                    density = 1,\z
                                    radius = aquilo_spot_size * sqrt(control:water_cryovolcano:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "paracelsin_water_cryovolcano_probability",
    expression = "(control:water_cryovolcano:size > 0)\z
                  * (max(paracelsin_starting_water_cryovolcano * 0.02,\z
                         min(aquilo_starting_mask, paracelsin_water_cryovolcano_spots) * 0.015))"
  },
  {
    type = "noise-expression",
    name = "paracelsin_water_cryovolcano_richness",
    expression = "max(paracelsin_starting_water_cryovolcano * 1800000,\z
                      paracelsin_water_cryovolcano_spots * 1440000) * control:water_cryovolcano:richness"
  },
 {
    type = "noise-expression",
    name = "paracelsin_vaterite_richness",
    expression = "4000 * max(starting, (gleba_simple_spot(1000, 6 * size ^ 0.5, 80 / frequency ^ 0.5, gleba_highland) * max(gleba_highland, gleba_midland_aux_2)*(sqrt(x*x + y*y)/20))) * richness / size",
    local_expressions =
    {
      richness = "control:vaterite:richness",
      frequency = "control:vaterite:frequency",
      size = "control:vaterite:size",
      starting = "starting_spot_at_angle{ angle = gleba_starting_angle + 85 * gleba_starting_direction,\z
                                          distance = 80 * gleba_starting_area_multiplier,\z
                                          radius = 7 * size ^ 0.5,\z
                                          x_distortion = gleba_wobble_x * 8,\z
                                          y_distortion = gleba_wobble_x * 8}"
    }
  },
  {
    type = "noise-expression",
    name = "paracelsin_vaterite_probability",
    expression = "(control:vaterite:size > 0) * (paracelsin_vaterite_richness > 1)"
  },
  {
    type = "noise-expression",
    name = "paracelsin_sphalerite_size",
    expression = "slider_rescale(control:sphalerite:size, 2)"
  },
  {
    type = "noise-expression",
    name = "paracelsin_sphalerite_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(paracelsin_starting_sphalerite,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_non_metal_spots(782349, 12, 1,\z
                                                         paracelsin_sphalerite_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                         control:sphalerite:frequency,\z
                                                         vulcanus_ashlands_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "paracelsin_sphalerite_probability",
    expression = "(control:sphalerite:size > 0) * (1000 * ((1 + paracelsin_sphalerite_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "paracelsin_sphalerite_richness",
    expression = "paracelsin_sphalerite_region * random_penalty_between(0.9, 1, 1)\z
                  * 18000 * vulcanus_starting_area_multiplier\z
                  * control:sphalerite:richness / paracelsin_sphalerite_size"
  },
  {
    type = "noise-expression",
    name = "paracelsin_tetrahedrite_size",
    expression = "slider_rescale(control:tetrahedrite:size, 2)"
  },
  {
    type = "noise-expression",
    name = "paracelsin_tetrahedrite_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(paracelsin_starting_tetrahedrite,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_non_metal_spots(749, 12, 1,\z
                                                         paracelsin_tetrahedrite_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                         control:tetrahedrite:frequency,\z
                                                         vulcanus_mountains_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "paracelsin_tetrahedrite_probability",
    expression = "(control:tetrahedrite:size > 0) * (1000 * ((1 + paracelsin_tetrahedrite_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "paracelsin_tetrahedrite_richness",
    expression = "paracelsin_tetrahedrite_region * random_penalty_between(0.9, 1, 1)\z
                  * 24000 * vulcanus_starting_area_multiplier\z
                  * control:tetrahedrite:richness / paracelsin_tetrahedrite_size"
  },
})

planet_map_gen.paracelsin = function()
  return
  {
    property_expression_names =
    {
      elevation = "vulcanus_elevation",
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:sphalerite:probability"] = "paracelsin_sphalerite_probability",
      ["entity:sphalerite:richness"] = "paracelsin_sphalerite_richness",
      ["entity:tetrahedrite:probability"] = "paracelsin_tetrahedrite_probability",
      ["entity:tetrahedrite:richness"] = "paracelsin_tetrahedrite_richness",
      ["entity:vaterite:probability"] = "paracelsin_vaterite_probability",
      ["entity:vaterite:richness"] = "paracelsin_vaterite_richness",
      ["entity:water-cryovolcano:probability"] = "paracelsin_water_cryovolcano_probability",
      ["entity:water-cryovolcano:richness"] = "paracelsin_water_cryovolcano_richness",
    },
    cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },
    autoplace_controls =
    {
      ["sphalerite"] = {},
      ["water_cryovolcano"] = {},
      ["tetrahedrite"] = {},
      ["vaterite"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          
          ["volcanic-soil-dark"] = {},
          ["volcanic-soil-light"] = {},
          ["volcanic-ash-soil"] = {},
          ["volcanic-ash-light"] = {},
          ["volcanic-ash-dark"] = {},
          ["nitrogen-lake"] = {},
          ["volcanic-cracks"] = {},
          ["volcanic-folds"] = {},
          ["volcanic-folds-flat"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["tiny-rock-cluster"] = {},
          ["waves-decal"] = {},
          ["lithium-iceberg-medium"] = {},
          ["lithium-iceberg-small"] = {},
          ["lithium-iceberg-tiny"] = {},
          ["floating-iceberg-large"] = {},
          ["floating-iceberg-small"] = {},
          ["aqulio-ice-decal-blue"] = {},
          ["aqulio-snowy-decal"] = {},
          ["snow-drift-decal"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["vaterite"] = {},
          ["water-cryovolcano"] = {},
          ["sphalerite"] = {},
          ["tetrahedrite"] = {},
          ["crater-cliff"] = {},
          ["big-metallic-rock"] = {},
          ["crashed-fulgoran-pod"] = {},
        }
      }
    }
  }
end

data:extend{{
    type = "planet",
    name = "paracelsin",
    icon = "__Paracelsin-Graphics__/graphics/icons/paracelsin.png",
    starmap_icon = "__Paracelsin-Graphics__/graphics/icons/starmap-planet-paracelsin.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 42,
    orientation = 0.31,
    magnitude = 1.0,
    label_orientation = 0.15,
    order = "f",
    temperature = -195,
    subgroup = "planets",
    map_gen_settings = planet_map_gen.paracelsin(),
    pollutant_type = nil,
    solar_power_in_space = 50,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_aquilo, 
    surface_properties =
    {
      ["day-night-cycle"] = 15 * minute,
      ["magnetic-field"] = 50,
      pressure = 5300,
      ["solar-power"] = 0,
      gravity = 65
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_paracelsin, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}}
            }
          },
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
    entities_require_heating = true,
    player_effects =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "aquilo-snow-smoke",
          speed = {0, 0.1},
          initial_height = 0.5,
          speed_multiplier = 1,
          speed_multiplier_deviation = 0.5,
          starting_frame = 8,
          starting_frame_deviation = 8,
          offset_deviation = {{-96, -48}, {96, 48}},
          speed_from_center = 0.04,
          speed_from_center_deviation = 0.2
        }
      }
    },
    ticks_between_player_effects = 2
  },
  {
    type = "space-connection",
    name = "fulgora-paracelsin",
    subgroup = "planet-connections",
    from = "fulgora",
    to = "paracelsin",
    order = "g1",
    length = 35000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_paracelsin)
  },
  {
    type = "space-connection",
    name = "paracelsin-aquilo",
    subgroup = "planet-connections",
    from = "paracelsin",
    to = "aquilo",
    order = "g2",
    length = 50000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_paracelsin)
  },
  {
    type = "space-connection",
    name = "paracelsin-solar-system-edge",
    subgroup = "planet-connections",
    from = "paracelsin",
    to = "solar-system-edge",
    order = "h1",
    length = 100000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.paracelsin_solar_system_edge)
  },}