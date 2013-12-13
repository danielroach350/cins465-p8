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

ActiveRecord::Schema.define(version: 20131212171156) do

  create_table "fish", force: true do |t|
    t.string   "fish_type"
    t.float    "fish_length"
    t.float    "fish_weight"
    t.string   "caught_on"
    t.float    "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "caught_date"
    t.string   "fish_photo"
  end

  create_table "notes", force: true do |t|
    t.string   "comment"
    t.integer  "fish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "first"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weathers", force: true do |t|
    t.string   "weather_info"
    t.integer  "fish_id"
    t.string   "currentTime"
    t.float    "moonPercentage"
    t.string   "location"
    t.string   "zipCode"
    t.float    "elevation"
    t.string   "observationLocation"
    t.string   "observationLocationElevation"
    t.string   "observationTime"
    t.string   "currentWeather"
    t.string   "temperature"
    t.string   "relative_humidity"
    t.string   "windInformation"
    t.string   "precipToday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
