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

ActiveRecord::Schema.define(version: 2019_07_25_132129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_splits", force: :cascade do |t|
    t.integer "flatmate_id"
    t.integer "bill_id"
    t.float "total_owed"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string "name"
    t.float "total"
    t.string "desc"
    t.integer "flatmate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calenders", force: :cascade do |t|
    t.integer "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.boolean "allDay"
    t.datetime "start"
    t.datetime "end"
    t.string "desc"
    t.integer "flatmate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flatmates", force: :cascade do |t|
    t.integer "flat_id"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "birthday"
    t.date "move_in"
    t.date "rent_due"
    t.date "water_due"
    t.date "electricity_due"
    t.date "gas_due"
    t.string "avatar"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.string "flat_key"
    t.string "address_one"
    t.string "address_two"
    t.string "city"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "shopping_list_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "note"
    t.integer "flatmate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.integer "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "flat_id"
    t.string "name"
    t.string "avatar"
    t.string "description"
    t.integer "flatmate_id"
    t.datetime "week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
