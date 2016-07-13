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

ActiveRecord::Schema.define(version: 20160712074026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balls", force: :cascade do |t|
    t.integer  "bowler"
    t.integer  "batsman"
    t.integer  "over_id"
    t.integer  "match_id"
    t.integer  "delivery"
    t.boolean  "four"
    t.boolean  "six"
    t.integer  "runs"
    t.boolean  "wicket"
    t.integer  "catcher"
    t.boolean  "done"
    t.boolean  "declared"
    t.string   "out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.date     "date"
    t.integer  "home"
    t.integer  "away"
    t.integer  "overs"
    t.integer  "over_count"
    t.integer  "first_to_bat"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "total_overs"
  end

  create_table "matchteams", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "out"
    t.integer  "batting_order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "team_id"
  end

  create_table "overs", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "surname"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "institute"
    t.integer  "year"
    t.string   "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
