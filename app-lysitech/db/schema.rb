# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_09_013215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "call_description"
    t.text "solution"
    t.date "begin_date"
    t.date "end_date"
    t.string "status"
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_calls_on_client_id"
    t.index ["user_id"], name: "index_calls_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "fullname"
    t.string "phone"
    t.string "email"
    t.string "cpf"
    t.string "cnpj"
    t.string "street"
    t.string "house_number"
    t.string "district"
    t.string "city"
    t.string "cep"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_num"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_phones_on_profile_id"
  end

  create_table "profile_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "fullname"
    t.string "register"
    t.string "department"
    t.string "email"
    t.bigint "profile_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_type_id"], name: "index_profiles_on_profile_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "userpassword"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_users_on_profile_id"
  end

  add_foreign_key "calls", "clients"
  add_foreign_key "calls", "users"
  add_foreign_key "phones", "profiles"
  add_foreign_key "profiles", "profile_types"
  add_foreign_key "users", "profiles"
end
