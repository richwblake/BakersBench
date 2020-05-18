class User < ApplicationRecord
    # Enable bcrypt hashed password
    has_secure_password

    # ActiveRecord associations
    has_many :subscriptions
    has_many :recipes, through: :subscriptions

    # Validations on user creation
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true

    
end
