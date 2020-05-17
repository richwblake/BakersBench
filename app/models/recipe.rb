class Recipe < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def owner
        User.find_by(id: self.creator_id)
    end
end
