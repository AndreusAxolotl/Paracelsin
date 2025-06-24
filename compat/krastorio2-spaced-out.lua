if mods["Krastorio2-spaced-out"] then
    if data.raw["lab"]["kr-advanced-lab"] then
        local lab = data.raw["lab"]["kr-advanced-lab"]
        if lab.inputs then
            lab.inputs[#lab.inputs+1] = "galvanization-science-pack"
        end
    end
    if data.raw["lab"]["kr-singularity-lab"] then
        local lab = data.raw["lab"]["kr-singularity-lab"]
        if lab.inputs then
            lab.inputs[#lab.inputs+1] = "galvanization-science-pack"
        end
    end
end
