# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170201203534) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_user_categories", force: :cascade do |t|
    t.integer "image_user_id"
    t.integer "category_id"
  end

  add_index "image_user_categories", ["category_id"], name: "index_image_user_categories_on_category_id"
  add_index "image_user_categories", ["image_user_id"], name: "index_image_user_categories_on_image_user_id"

  create_table "image_users", force: :cascade do |t|
    t.integer "image_id"
    t.integer "user_id"
  end

  add_index "image_users", ["image_id"], name: "index_image_users_on_image_id"
  add_index "image_users", ["user_id"], name: "index_image_users_on_user_id"

  create_table "image_wishlists", force: :cascade do |t|
    t.integer "wishlist_id"
    t.integer "image_id"
  end

  add_index "image_wishlists", ["image_id"], name: "index_image_wishlists_on_image_id"
  add_index "image_wishlists", ["wishlist_id"], name: "index_image_wishlists_on_wishlist_id"

  create_table "images", force: :cascade do |t|
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pictureuploader"
    t.string   "description"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["user_id"], name: "index_menus_on_user_id"

  create_table "multiples", force: :cascade do |t|
    t.string   "multiple"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "salon_name"
    t.string   "salon_location"
    t.string   "appointment_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_stylist",             default: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin",                  default: false
    t.string   "w"
    t.string   "c"
    t.string   "m"
    t.string   "u"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id"

end
