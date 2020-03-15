class AddCategoryIdToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_reference :recommendations, :category, foreign_key: true
  end
end
