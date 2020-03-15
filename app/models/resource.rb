class Resource < ApplicationRecord
  has_many :recommendations_resources
  belongs_to :category
end
