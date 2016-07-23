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

ActiveRecord::Schema.define(version: 20160718130602) do

  create_table "approvals", force: :cascade do |t|
    t.string   "skill"
    t.integer  "voted"
    t.string   "voter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.string   "platform"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "version"
    t.string   "picture"
  end

  create_table "apps_developers", id: false, force: :cascade do |t|
    t.integer "app_id"
    t.integer "developer_id"
  end

  create_table "apps_invites", id: false, force: :cascade do |t|
    t.integer "app_id"
    t.integer "invite_id"
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs", force: :cascade do |t|
    t.integer  "app_id"
    t.string   "founder"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "Game"
    t.string   "Photo"
    t.string   "Family"
    t.string   "Music"
    t.string   "Shopping"
    t.string   "Social"
    t.string   "Communication"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "developer_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["developer_id"], name: "index_comments_on_developer_id"
  add_index "comments", ["micropost_id"], name: "index_comments_on_micropost_id"

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
    t.string   "picture"
  end

  create_table "developers_invites", id: false, force: :cascade do |t|
    t.integer "developer_id"
    t.integer "invite_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string   "app"
    t.string   "sender"
    t.string   "receiver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "liker_id"
    t.integer  "liked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loves", force: :cascade do |t|
    t.integer  "lover_id"
    t.integer  "loved_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "developer_id"
    t.integer  "app_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "picture"
    t.string   "app_version"
  end

  add_index "microposts", ["app_id"], name: "index_microposts_on_app_id"
  add_index "microposts", ["developer_id", "app_id", "created_at"], name: "index_microposts_on_developer_id_and_app_id_and_created_at"
  add_index "microposts", ["developer_id"], name: "index_microposts_on_developer_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "notifier_id"
    t.integer  "notified_id"
    t.integer  "opinion_id"
    t.string   "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notifications", ["notified_id"], name: "index_notifications_on_notified_id"
  add_index "notifications", ["notifier_id"], name: "index_notifications_on_notifier_id"
  add_index "notifications", ["opinion_id"], name: "index_notifications_on_opinion_id"

  create_table "opinions", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean "read"
  end

  add_index "opinions", ["micropost_id"], name: "index_opinions_on_micropost_id"
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id"

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "app_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "html_css",    default: 0
    t.integer  "java",        default: 0
    t.integer  "javascript",  default: 0
    t.integer  "c",           default: 0
    t.integer  "c_plus_plus", default: 0
    t.integer  "nodejs",      default: 0
    t.integer  "database",    default: 0
    t.integer  "algorithms",  default: 0
    t.integer  "android",     default: 0
    t.integer  "ios",         default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "spins", force: :cascade do |t|
    t.integer  "spiner_id"
    t.integer  "spined_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "categories",      default: "--- []\n"
  end

end
