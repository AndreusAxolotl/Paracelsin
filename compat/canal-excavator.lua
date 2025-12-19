if not mods["canal-excavator"] then return end

data:extend({{
  type = "mod-data",
  name = "canex-paracelsin-config",
  data_type = "canex-surface-config",
  data = {
    surfaceName = "paracelsin",
    localisation = {"space-location-name.paracelsin"},
    oreStartingAmount = 20,
    mining_time = 8,
    tint = {r = 180, g = 165, b = 145},
    mineResult = "stone"
  },
}})