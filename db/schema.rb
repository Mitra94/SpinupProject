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

ActiveRecord::Schema.define(version: 20160625102121) do

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.string   "platform"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps_developers", id: false, force: :cascade do |t|
    t.integer "app_id"
    t.integer "developer_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "surname"
    t.string   "city"
    t.integer  "age"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "developer_id"
    t.integer  "app_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "picture"
  end

  add_index "microposts", ["app_id"], name: "index_microposts_on_app_id"
  add_index "microposts", ["developer_id", "app_id", "created_at"], name: "index_microposts_on_developer_id_and_app_id_and_created_at"
  add_index "microposts", ["developer_id"], name: "index_microposts_on_developer_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
  end

end
