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

ActiveRecord::Schema.define(version: 20150626143625) do

  create_table "contact_informations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "phone_number", limit: 50
    t.string   "address_1",    limit: 255
    t.string   "address_2",    limit: 255
    t.string   "city",         limit: 50
    t.string   "country",      limit: 50
    t.string   "state",        limit: 50
    t.integer  "zip",          limit: 8
    t.boolean  "visible",      limit: 1,   default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "contact_informations", ["user_id"], name: "index_contact_informations_on_user_id", using: :btree

  create_table "guide_categories", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.integer  "position",   limit: 4
    t.boolean  "visible",    limit: 1,  default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "guides", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "guide_category_id", limit: 4
    t.string   "name",              limit: 255
    t.integer  "position",          limit: 4
    t.text     "content",           limit: 65535
    t.boolean  "visible",           limit: 1,     default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "guides", ["guide_category_id"], name: "index_guides_on_guide_category_id", using: :btree
  add_index "guides", ["user_id"], name: "index_guides_on_user_id", using: :btree

  create_table "review_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "position",   limit: 4
    t.boolean  "visible",    limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "review_category_id", limit: 4
    t.string   "name",               limit: 255
    t.integer  "position",           limit: 4
    t.text     "content",            limit: 65535
    t.boolean  "visible",            limit: 1,     default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "reviews", ["review_category_id"], name: "index_reviews_on_review_category_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.integer  "parentid",    limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "travel_categories", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.integer  "position",   limit: 4
    t.boolean  "visible",    limit: 1,  default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "travel_category_id", limit: 4
    t.string   "name",               limit: 255
    t.integer  "position",           limit: 4
    t.text     "content",            limit: 65535
    t.boolean  "visible",            limit: 1,     default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "travels", ["travel_category_id"], name: "index_travels_on_travel_category_id", using: :btree
  add_index "travels", ["user_id"], name: "index_travels_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "role_id",         limit: 4
    t.string   "username",        limit: 50
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "password_digest", limit: 255
    t.text     "auth_token",      limit: 65535
    t.string   "email",           limit: 100,   default: "", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "stock",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
