module RecipeHelper
    def current_user_is_not_subscribed_to(recipe)
        !current_user.recipes.include?(recipe)
    end
end