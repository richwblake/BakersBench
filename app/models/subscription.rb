class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # Validations on sub_comment field
  validates :sub_comment, presence: true
end
