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

ActiveRecord::Schema.define(version: 2020_04_05_181551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prices", force: :cascade do |t|
    t.integer "price"
    t.integer "price_type", limit: 2, null: false
    t.bigint "product_id", null: false
    t.integer "unit_gross", null: false
    t.integer "unit_net", null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.boolean "buyable", default: false, null: false
    t.string "description"
    t.string "identifier", null: false
    t.string "name"
  end

  create_table "settings", force: :cascade do |t|
    t.decimal "special", precision: 5, scale: 4, null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.bigint "price_id", null: false
    t.integer "value", null: false
    t.index ["price_id"], name: "index_taxes_on_price_id"
  end

  add_foreign_key "prices", "products"
  add_foreign_key "taxes", "prices"
end
