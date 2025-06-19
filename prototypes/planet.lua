require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
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
  },})

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
      ["entity:sphalerite:probability"] = "vulcanus_coal_probability",
      ["entity:sphalerite:richness"] = "vulcanus_coal_richness",
      ["entity:tetrahedrite:probability"] = "vulcanus_calcite_probability",
      ["entity:tetrahedrite:richness"] = "vulcanus_calcite_richness",
      ["entity:vaterite:probability"] = "gleba_stone_probability",
      ["entity:vaterite:richness"] = "gleba_stone_richness",
      ["entity:water-cryovolcano:probability"] = "aquilo_crude_oil_probability",
      ["entity:water-cryovolcano:richness"] = "aquilo_crude_oil_richness",
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
    gravity_pull = 12,
    distance = 40,
    orientation = 0.45,
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
      ["solar-power"] = 1,
      gravity = 12
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
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
    order = "x",
    length = 35000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
{
    type = "space-connection",
    name = "nauvis-paracelsin",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "paracelsin",
    order = "y",
    length = 45000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
  }}