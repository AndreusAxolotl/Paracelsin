require "compat.aop"

if mods["Cerys-Moon-of-Fulgora"] then
    local tech = data.raw.technology["fluid-handling"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "nitric-acid-barrel" then
      table.remove(tech.effects, i)
    end
end
local tech = data.raw.technology["fluid-handling"]
for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "empty-nitric-acid-barrel" then
      table.remove(tech.effects, i)
    end
end
data.raw.fluid["nitric-acid"]= nil
data.raw.item["nitric-acid-barrel"]= nil
data.raw.recipe["nitric-acid-barrel-recycling"]= nil
data.raw.recipe["empty-nitric-acid-barrel"]= nil
data.raw.recipe["nitric-acid-barrel"]= nil
data.raw.recipe["nitric-acid"].results = {
			{ type = "fluid", name = "paracelsin-nitric-acid", amount = 50 },
		}
data.raw.recipe["cerysian-science-pack"].ingredients = {
			{ type = "item", name = "superconductor", amount = 2 },
			{ type = "item", name = "uranium-238", amount = 5 },
			{ type = "fluid", name = "paracelsin-nitric-acid", amount = 50 },
			{ type = "item", name = "ancient-structure-repair-part", amount = 1 },
		}
data.raw.recipe["processing-units-from-nitric-acid"].ingredients = {
			{ type = "item", name = "electronic-circuit", amount = 16 },
			{ type = "item", name = "advanced-circuit", amount = 2 },
			{ type = "fluid", name = "paracelsin-nitric-acid", amount = 5 },
		}
data.raw.recipe["mixed-oxide-cell-reprocessing"].ingredients = {
			{ type = "item", name = "depleted-mixed-oxide-fuel-cell", amount = 1 },
			{ type = "fluid", name = "paracelsin-nitric-acid", amount = 20 },}
end