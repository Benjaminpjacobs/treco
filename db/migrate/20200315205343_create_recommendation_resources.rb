class CreateRecommendationResources < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations_resources do |t|
      t.references :recommendations, null: false, foreign_key: true
      t.references :resources, null: false, foreign_key: true
      t.string :timestamps
    end
  end
end
