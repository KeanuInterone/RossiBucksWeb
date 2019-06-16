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

ActiveRecord::Schema.define(version: 2019_06_15_211859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.index ["order_id", "product_id"], name: "index_order_products_on_order_id_and_product_id"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_orders_on_user_id_and_shop_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "ean"
    t.integer "points"
    t.boolean "available_in_app"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brand_id"
    t.string "name"
    t.index ["ean"], name: "index_products_on_ean", unique: true
  end

  create_table "shop_employees", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.index ["shop_id"], name: "index_shop_employees_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_shop_employees_on_user_id_and_shop_id", unique: true
    t.index ["user_id"], name: "index_shop_employees_on_user_id"
  end

  create_table "shop_reps", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.index ["shop_id"], name: "index_shop_reps_on_shop_id"
    t.index ["user_id", "shop_id"], name: "index_shop_reps_on_user_id_and_shop_id", unique: true
    t.index ["user_id"], name: "index_shop_reps_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "account_number", null: false
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_number"], name: "index_shops_on_account_number", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.integer "points", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
