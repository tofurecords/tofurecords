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


ActiveRecord::Schema.define(version: 2018_07_15_044258) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "image_id"
    t.string "label"
    t.text "hp"
    t.string "twitter"
    t.integer "proceed"
    t.boolean "recommend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boughtitems", force: :cascade do |t|
    t.integer "cd_id"
    t.integer "quantity"
    t.integer "subtotal"
    t.integer "bought_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boughts", force: :cascade do |t|
    t.integer "user_id"
    t.string "status"
    t.string "name"
    t.string "post"
    t.string "address"
    t.string "tel"
    t.string "kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cartitems", force: :cascade do |t|
    t.integer "cd_id"
    t.integer "cart_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cds", force: :cascade do |t|
    t.string "title"
    t.text "image_id"
    t.integer "price"
    t.integer "genre", default: 0
    t.integer "stock"
    t.date "release"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proceed"
  end

  create_table "discs", force: :cascade do |t|
    t.integer "cd_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.text "artist_name"
    t.text "song_name"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.string "post"
    t.string "address"
    t.string "tel"
    t.string "kana"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.text "name"
    t.integer "disc_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "kana"
    t.string "post"
    t.string "address"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
