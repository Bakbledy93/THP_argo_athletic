# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_094537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capacities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscular_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "date_of_birth"
    t.integer "height"
    t.integer "weight"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_muscular_group_capacities", force: :cascade do |t|
    t.bigint "sport_role_id"
    t.bigint "muscular_group_id"
    t.bigint "capacity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capacity_id"], name: "index_roles_muscular_group_capacities_on_capacity_id"
    t.index ["muscular_group_id"], name: "index_roles_muscular_group_capacities_on_muscular_group_id"
    t.index ["sport_role_id"], name: "index_roles_muscular_group_capacities_on_sport_role_id"
  end

  create_table "sport_profiles", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_sport_profiles_on_profile_id"
    t.index ["sport_id"], name: "index_sport_profiles_on_sport_id"
  end

  create_table "sport_roles", force: :cascade do |t|
    t.string "name"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_sport_roles_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.boolean "team_sport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_method_exercises", force: :cascade do |t|
    t.bigint "training_method_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_training_method_exercises_on_exercise_id"
    t.index ["training_method_id"], name: "index_training_method_exercises_on_training_method_id"
  end

  create_table "training_methods", force: :cascade do |t|
    t.string "name"
    t.bigint "capacity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capacity_id"], name: "index_training_methods_on_capacity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "roles_muscular_group_capacities", "capacities"
  add_foreign_key "roles_muscular_group_capacities", "muscular_groups"
  add_foreign_key "roles_muscular_group_capacities", "sport_roles"
  add_foreign_key "training_method_exercises", "exercises"
  add_foreign_key "training_method_exercises", "training_methods"
  add_foreign_key "training_methods", "capacities"
  add_foreign_key "users", "profiles"
end
