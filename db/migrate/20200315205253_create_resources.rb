class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.jsonb :meta_data
      t.references :category, null: false, foreign_key: true
      t.string :timestamps
    end
  end
end
