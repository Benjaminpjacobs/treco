class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
