class CreateUserRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :users_recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
