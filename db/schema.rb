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

ActiveRecord::Schema.define(version: 20170224235222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "text",                       null: false
    t.integer  "poll_id"
    t.boolean  "chosen?",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["poll_id"], name: "index_answers_on_poll_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "adder_id"
    t.integer  "accepter_id"
    t.boolean  "accepted?",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "polls", force: :cascade do |t|
    t.string   "question",                  null: false
    t.datetime "expiration",                null: false
    t.string   "comment"
    t.integer  "creator_id",                null: false
    t.boolean  "active?",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "name",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "invite_code"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_votes_on_answer_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "answers", "polls"
  add_foreign_key "votes", "answers"
  add_foreign_key "votes", "users"
end
