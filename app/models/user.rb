class User < ApplicationRecord
  has_secure_password

  has_many :recommended, class_name: "Recommendation"
  has_many :users_recommendations
  has_many :recommendations, through: :users_recommendations

  def username
    email_address.split(/@/).first
  end
end

