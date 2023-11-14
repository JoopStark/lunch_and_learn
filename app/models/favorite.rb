class Favorite < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :country, presence: true
  validates :recipe_link, presence: true
  validates :recipe_title, presence: true
end