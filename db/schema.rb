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

ActiveRecord::Schema.define(version: 20161015011513) do

  create_table "advisors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "email"
    t.string   "password_salt"
    t.string   "password"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "pw_reset_identifier"
  end

  add_index "advisors", ["email"], name: "index_advisors_on_email", unique: true
  add_index "advisors", ["pw_reset_identifier"], name: "index_advisors_on_pw_reset_identifier"

  create_table "contact_messages", force: :cascade do |t|
    t.text     "content"
    t.string   "reply_address"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "listing_messages", force: :cascade do |t|
    t.text     "content"
    t.string   "reply_address"
    t.integer  "listing_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.integer  "advisor_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "listing_image"
    t.string   "tags",          default: "no_tag_yet"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "profile_image"
    t.text     "description"
    t.integer  "advisor_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "job_title"
    t.boolean  "application_help",     default: true
    t.boolean  "career_insights_help", default: true
    t.boolean  "mentoring_help",       default: true
    t.boolean  "general_help",         default: true
    t.integer  "session_price"
    t.string   "max_no_of_session"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "requesting_email"
    t.text     "requesting_availability"
    t.integer  "advisor_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "indicated_interest"
    t.string   "requesting_name"
  end

end
