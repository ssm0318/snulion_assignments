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

ActiveRecord::Schema.define(version: 20180514090009) do

  create_table "event_comment_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_comment_id"], name: "index_event_comment_likes_on_event_comment_id"
    t.index ["user_id"], name: "index_event_comment_likes_on_user_id"
  end

  create_table "event_comments", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_event_comments_on_user_id"
  end

  create_table "event_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_replies", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.integer "event_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_event_replies_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.date "datetime"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "feed_comment_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "feed_comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_comment_id"], name: "index_feed_comment_likes_on_feed_comment_id"
    t.index ["user_id"], name: "index_feed_comment_likes_on_user_id"
  end

  create_table "feed_comments", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.integer "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feed_comments_on_user_id"
  end

  create_table "feed_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "feed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_replies", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.integer "feed_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feed_replies_on_user_id"
  end

  create_table "feed_reply_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "feed_reply_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_reply_id"], name: "index_feed_reply_likes_on_feed_reply_id"
    t.index ["user_id"], name: "index_feed_reply_likes_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_follows_on_followee_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
