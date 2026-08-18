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
        cloudiness = 0.9,
        surface_vertical_offset = 0.1,
        cloud_vertical_offset = 0.015,
        specular_intensity = 1,
        atmosphere_color = { 0.055, 0.09, 0.11, 0.1 },
        cloud_flow_intensity = 0.5,
        cloud_panning_rate = -0.1,
        rotation_seconds = -660,
        planet_axis = { -33.0, -3.0 },
        planet_axis_deviation_amplitude = { 10.0, 10.0 },
        planet_axis_deviation_seconds = { 890.5, 753.7 },
        position = { -680, 601 },
        parallax_strength = { 0.95, 0.95 },
        light_direction = { -0.42, 0.23, 0.67 },
        light_radius = 8.9,
        light_intensity_contrast = 0.3,
        radius = 600,
        planet_surface = {
    filename = "__Paracelsin-Graphics__/graphics/planet/paracelsin.png",
    width = 2048,
    height = 1024,
  },
        planet_reflectivity =
        {
            filename = "__space-age__/graphics/space/vulcanus-emission.png",
            width = 2048,
            height = 1024
        },
        global_cloud = {
    filename = "__Paracelsin-Graphics__/graphics/planet/paracelsin-cloud.png",
    width = 2048,
    height = 1024,
  },
        global_cloud_normal =
        {
            filename = "__space-age__/graphics/space/fulgora-cloud-normal.png",
            width = 2048,
            height = 1024
        },
        global_cloud_flow =
        {
            filename = "__space-age__/graphics/space/fulgora-cloud-flow.png",
            width = 2048,
            height = 1024
        }
    }
}
