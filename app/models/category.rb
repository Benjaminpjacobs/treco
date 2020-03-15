class Category < ApplicationRecord
  has_many :recommendations
  has_many :resources
end
