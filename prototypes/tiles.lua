local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

local aquilo_tile_offset_frozen = 50
local aquilo_tile_offset_thawed = 60

local smooth_ice_vehicle_speed_modifier = 1
local ice_vehicle_speed_modifier = 1.4
local snow_vehicle_speed_modifier = 1.8

local function lerp_color_no_alpha(a, b, amount)
  return
  {
    a[1] + amount * (b[1] - a[1]),
    a[2] + amount * (b[2] - a[2]),
    a[3] + amount * (b[3] - a[3])
  }
end

local snow_map_color_low = {156, 166, 181}
local snow_map_color_high = {190, 194, 197}

require("__space-age__/prototypes/tile/tiles-aquilo")
require("__space-age__/prototypes/tile/tiles-vulcanus")

table.insert(water_tile_type_names, "nitrogen-lake")

local nitrogen_lake = table.deepcopy(data.raw.tile["water"])
nitrogen_lake.name = "nitrogen-lake"
nitrogen_lake.order = "a[paracelsin-water]-a[nitrogen-lake]"
nitrogen_lake.subgroup = "aquilo-tiles"
nitrogen_lake.fluid = "nitrogen"
nitrogen_lake.collision_mask = tile_collision_masks.water()
nitrogen_lake.effect_color = {103, 121, 135}
nitrogen_lake.effect_color_secondary = { 61, 83, 88 }
nitrogen_lake.map_color={57, 64, 77 }
nitrogen_lake.default_cover_tile = "landfill"
nitrogen_lake.autoplace = {probability_expression = "max(lava_basalts_range, lava_mountains_range)"}

data:extend({
  nitrogen_lake,})

local function add_landfillable_stuff(landfill_name, new_surface)
  local item = data.raw.item[landfill_name]
  item.place_as_tile.tile_condition = item.place_as_tile.tile_condition or {}
  table.insert(item.place_as_tile.tile_condition, new_surface)
end
add_landfillable_stuff("landfill", "nitrogen-lake")
add_landfillable_stuff("foundation", "nitrogen-lake")

