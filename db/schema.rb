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

ActiveRecord::Schema.define(version: 20140223084734) do

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "song_id"
    t.integer  "fellow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fellows", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "confirmation_token", limit: 25
    t.string   "gender",             limit: 10
    t.string   "region"
    t.text     "about_me"
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fellows_songs", force: true do |t|
    t.integer "fellow_id"
    t.integer "song_id"
  end

  create_table "gifts", force: true do |t|
    t.boolean  "keyboard",    default: false
    t.boolean  "guitar",      default: false
    t.boolean  "tabla",       default: false
    t.boolean  "singer",      default: false
    t.boolean  "song_writer", default: false
    t.boolean  "drum_set",    default: false
    t.boolean  "flute",       default: false
    t.boolean  "trumpet",     default: false
    t.boolean  "violin",      default: false
    t.integer  "fellow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title",       limit: 30
    t.string   "reference"
    t.string   "type"
    t.string   "language"
    t.text     "lyrics"
    t.integer  "keyboard"
    t.integer  "guitar"
    t.integer  "tabla"
    t.integer  "singer"
    t.integer  "song_writer"
    t.integer  "drum_set"
    t.integer  "flute"
    t.integer  "trumpet"
    t.integer  "violin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
