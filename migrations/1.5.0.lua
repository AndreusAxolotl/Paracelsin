local surface = game.get_surface("paracelsin")
if not surface then return end

local mgs = surface.map_gen_settings
mgs.autoplace_settings.entity.settings["big-metallic-rock"] = {}
mgs.autoplace_settings.entity.settings["crashed-fulgoran-pod"] = {}
surface.map_gen_settings = mgs
-- mgs stands for metal gear solid and not map gen settings trust
game.print(
			"[Paracelsin]: If you don't find any Crashed Fulgoran Pods or Big Metallic Rocks nearby, just load some new chunks and you'll find some!")