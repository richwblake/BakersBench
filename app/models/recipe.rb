class Recipe < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions

    def owner
        User.find_by(id: self.creator_id)
    end
end
