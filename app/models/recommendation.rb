class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :users_recommendations, dependent: :destroy
  has_many :users, through: :users_recommendations
  belongs_to :category
end
