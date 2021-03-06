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

ActiveRecord::Schema.define(version: 2022_02_07_023532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "composers", force: :cascade do |t|
    t.string "name"
    t.integer "birth_year"
    t.integer "death_year"
    t.string "musical_era"
    t.integer "num_compositions"
    t.string "ethnicity"
    t.boolean "tonal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "maker"
    t.string "location"
    t.integer "year_opened"
    t.boolean "family_owned"
    t.string "ceo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pianos", force: :cascade do |t|
    t.string "model"
    t.string "style"
    t.integer "price"
    t.string "color"
    t.boolean "acoustic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manufacturer_id"
    t.integer "length"
    t.index ["manufacturer_id"], name: "index_pianos_on_manufacturer_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "opus"
    t.integer "number"
    t.string "type_of_piece"
    t.string "nickname"
    t.integer "composition_date"
    t.boolean "multiple_instruments"
    t.string "main_instrument"
    t.string "key_signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "composer_id"
    t.index ["composer_id"], name: "index_pieces_on_composer_id"
  end

  add_foreign_key "pianos", "manufacturers"
  add_foreign_key "pieces", "composers"
end
