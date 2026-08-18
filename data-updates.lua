require "compat.aai"
require "compat.galore"

PlanetsLib.set_special_properties("paracelsin",{rocket_part_multiplier=2})

data.raw.planet["paracelsin"].platform_surface_render_parameters =
{
    shadow_opacity = 0.5,
    space_dust_background =
    {
        animation_speed = 1,
        noise_texture =
        {
            filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
            size = 4096,
            premul_alpha = false
        },
        asteroid_texture =
        {
            filename = "__space-age__/graphics/space/asteroidTexture.png",
            size = 1024
        },
        asteroid_normal_texture =
        {
            filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
            size = 1024
        },
    },
    space_dust_foreground =
    {
        animation_speed = 1,
        noise_texture =
        {
            filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
            size = 4096,
            premul_alpha = false
        },
        asteroid_texture =
        {
            filename = "__space-age__/graphics/space/asteroidTexture.png",
            size = 1024
        },
        asteroid_normal_texture =
        {
            filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
            size = 1024
        },
    },
    platform_backdrop =
    {
  atmosphere_color = {
    21,
    26,
    30,
    255,
  },
  atmosphere_ray_light_color_1 = {
    178,
    161,
    141,
    255,
  },
  atmosphere_ray_light_color_2 = {
    25.5,
    21.49905,
    12.900450000000001,
    255,
  },
  atmosphere_thickness = 0.075,
  cloud_flow_intensity = 0.3,
  cloud_flow_seconds = 32,
  cloud_normal_intensity = 0.3,
  cloud_panning_rate = 0,
  cloud_vertical_offset = 0.015,
  cloudiness = 1,
  emission_scalar = 0.1,
  emission_scales_with_shadow = true,
  global_cloud = {
    filename = "__Paracelsin-Graphics__/graphics/planet/paracelsin-cloud.png",
    width = 2048,
    height = 1024,
  },
  global_cloud_flow = {
    filename = "__space-age__/graphics/space/fulgora-cloud-flow.png",
    width = 2048,
    height = 1024,
  },
  global_cloud_normal = {
    filename = "__space-age__/graphics/space/fulgora-cloud-normal.png",
    width = 2048,
    height = 1024,
  },
  light_color = {
    250.002,
    255,
    255,
    255,
  },
  light_direction = {
    -1,
    0,
    0.5,
  },
  light_intensity_contrast = 0.7,
  light_radius = 1,
  planet_axis = {
    -30,
    20,
  },
  planet_axis_deviation_amplitude = {
    0,
    0,
  },
  planet_axis_deviation_seconds = {
    609.2,
    712.7,
  },
  planet_surface = {
    filename = "__Paracelsin-Graphics__/graphics/planet/paracelsin.png",
    width = 2048,
    height = 1024,
  },
  radius = 400,
  rotation_seconds = 340,
  specular_color = {
    255,
    255,
    255,
    255,
  },
  specular_intensity = 1,
  surface_normal_intensity = 0.349,
  surface_vertical_offset = 0,
}
}
