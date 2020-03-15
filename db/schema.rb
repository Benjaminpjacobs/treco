# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_15_212457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_recommendations_on_category_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "recommendations_resources", force: :cascade do |t|
    t.bigint "recommendations_id", null: false
    t.bigint "resources_id", null: false
    t.string "timestamps"
    t.index ["recommendations_id"], name: "index_recommendations_resources_on_recommendations_id"
    t.index ["resources_id"], name: "index_recommendations_resources_on_resources_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.jsonb "meta_data"
    t.bigint "category_id", null: false
    t.string "timestamps"
    t.index ["category_id"], name: "index_resources_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "users_recommendations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recommendation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recommendation_id"], name: "index_users_recommendations_on_recommendation_id"
    t.index ["user_id"], name: "index_users_recommendations_on_user_id"
  end

  add_foreign_key "recommendations", "categories"
  add_foreign_key "recommendations", "users"
  add_foreign_key "recommendations_resources", "recommendations", column: "recommendations_id"
  add_foreign_key "recommendations_resources", "resources", column: "resources_id"
  add_foreign_key "resources", "categories"
  add_foreign_key "users_recommendations", "recommendations"
  add_foreign_key "users_recommendations", "users"
end
