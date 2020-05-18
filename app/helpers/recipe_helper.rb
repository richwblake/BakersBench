module RecipeHelper
    def current_user_is_not_subscribed_to(recipe)
        !current_user.recipes.include?(recipe)
    end

    def show_sub_comment_for(user, recipe)
        recipe.subscriptions.find_by(user_id: user.id).sub_comment
    end

    def find_original_creator_for(recipe)
        User.find_by(id: recipe.creator_id)
    end
end