class RecommendationsResource < ApplicationRecord
  belongs_to :recommendation
  belongs_to :resource
end
