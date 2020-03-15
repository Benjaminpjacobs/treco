class User < ApplicationRecord
  has_many :recommended, class_name: "Recommendation"
  has_many :users_recommendations
  has_many :recommendations, through: :users_recommendations
end
