class Recipe < ApplicationRecord
    # ActiveRecord associations
    has_many :subscriptions
    has_many :users, through: :subscriptions
    accepts_nested_attributes_for :subscriptions

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    has_many :amounts, through: :ingredients
    has_many :ingredient_types, through: :ingredients

    # Validations on model attributes
    validates :title, :total_prep_time, :description, presence: true

    def owner
        User.find_by(id: self.creator_id)
    end

    def self.find_recipes_by_title(query)
        where("title LIKE ?", query)
    end
end
