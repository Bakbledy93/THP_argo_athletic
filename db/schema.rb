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

ActiveRecord::Schema.define(version: 2020_09_11_134720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "capacities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quality_id"
    t.index ["quality_id"], name: "index_capacities_on_quality_id"
  end

  create_table "exercise_variants", force: :cascade do |t|
    t.bigint "exercise_id"
    t.bigint "variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_variants_on_exercise_id"
    t.index ["variant_id"], name: "index_exercise_variants_on_variant_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intensities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscle_variants", force: :cascade do |t|
    t.bigint "variant_id"
    t.bigint "muscle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscle_id"], name: "index_muscle_variants_on_muscle_id"
    t.index ["variant_id"], name: "index_muscle_variants_on_variant_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.bigint "muscular_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscular_group_id"], name: "index_muscles_on_muscular_group_id"
  end

  create_table "muscular_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "date_of_birth"
    t.float "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "sport"
    t.string "sport_role"
    t.index ["user_id"], name: "index_profiles_on_user_id"
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

  create_table "training_method_intensities", force: :cascade do |t|
    t.bigint "intensity_id"
    t.bigint "training_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intensity_id"], name: "index_training_method_intensities_on_intensity_id"
    t.index ["training_method_id"], name: "index_training_method_intensities_on_training_method_id"
  end

  create_table "training_method_levels", force: :cascade do |t|
    t.bigint "level_id"
    t.bigint "training_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_training_method_levels_on_level_id"
    t.index ["training_method_id"], name: "index_training_method_levels_on_training_method_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "name"
    t.bigint "extype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extype_id"], name: "index_variants_on_extype_id"
  end

  create_table "workout_programs", force: :cascade do |t|
    t.string "exercise"
    t.string "training_method"
    t.string "level"
    t.string "repetition"
    t.string "recuperation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_workout_programs_on_profile_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "capacities", "qualities"
  add_foreign_key "exercise_variants", "exercises"
  add_foreign_key "exercise_variants", "variants"
  add_foreign_key "muscle_variants", "muscles"
  add_foreign_key "muscle_variants", "variants"
  add_foreign_key "muscles", "muscular_groups"
  add_foreign_key "profiles", "users"
  add_foreign_key "roles_muscular_group_capacities", "capacities"
  add_foreign_key "roles_muscular_group_capacities", "muscular_groups"
  add_foreign_key "roles_muscular_group_capacities", "sport_roles"
  add_foreign_key "training_method_exercises", "exercises"
  add_foreign_key "training_method_exercises", "training_methods"
  add_foreign_key "training_method_intensities", "intensities"
  add_foreign_key "training_method_intensities", "training_methods"
  add_foreign_key "training_method_levels", "levels"
  add_foreign_key "training_method_levels", "training_methods"
  add_foreign_key "training_methods", "capacities"
  add_foreign_key "variants", "extypes"
  add_foreign_key "workout_programs", "profiles"
end
