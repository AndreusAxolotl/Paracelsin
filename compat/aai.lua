if not mods["aai-industry"] then return end

local function add_additional_categories(recipe_name, categories)
    local recipe = data.raw.recipe[recipe_name]
    if recipe and categories then
        recipe.additional_categories = recipe.additional_categories or {}
        for _, cat in pairs(categories) do
            table.insert(recipe.additional_categories, cat)
        end
    end
end
add_additional_categories("motor", {"mechanics"})
add_additional_categories("electric-motor", {"mechanics"})