class User < ApplicationRecord
    has_secure_password
    has_many :subscriptions
    has_many :recipes, through: :subscriptions
end
