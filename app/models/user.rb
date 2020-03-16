class User < ApplicationRecord
  has_secure_password

  has_many :recommended_to, class_name: "Recommendation"
  has_many :users_recommendations, dependent: :destroy
  has_many :recommendations, through: :users_recommendations


  def username
    email_address.split(/@/).first
  end
end

