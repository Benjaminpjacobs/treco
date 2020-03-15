class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :users_recommendations
  has_many :users, through: :users_recommendations
end
