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

ActiveRecord::Schema.define(version: 20160607013451) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "par"
    t.decimal  "rating",               precision: 3, scale: 1
    t.integer  "slope"
    t.boolean  "favourite"
    t.string   "tees"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "yardage",    limit: 2
    t.integer  "user_id"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "holes", force: :cascade do |t|
    t.integer  "number"
    t.integer  "par"
    t.boolean  "fairway"
    t.boolean  "green"
    t.integer  "putts"
    t.integer  "missed_driver"
    t.integer  "missed_fairway_metal"
    t.integer  "missed_rescue"
    t.integer  "missed_iron_long"
    t.integer  "missed_iron_mid"
    t.integer  "missed_iron_short"
    t.integer  "missed_chip"
    t.integer  "missed_pitch"
    t.integer  "missed_sand"
    t.integer  "missed_putt_long"
    t.integer  "missed_putt_mid"
    t.integer  "missed_putt_short"
    t.integer  "penalties"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "round_id"
  end

  add_index "holes", ["round_id"], name: "index_holes_on_round_id"

  create_table "rounds", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id"
    t.integer  "score"
    t.integer  "fairways"
    t.integer  "gir"
    t.integer  "putts"
    t.integer  "adjusted_score"
    t.integer  "missed_driver"
    t.integer  "missed_fairway_metal"
    t.integer  "missed_rescue"
    t.integer  "missed_iron_long"
    t.integer  "missed_iron_mid"
    t.integer  "missed_iron_short"
    t.integer  "missed_chip"
    t.integer  "missed_pitch"
    t.integer  "missed_sand"
    t.integer  "missed_putt_long"
    t.integer  "missed_putt_mid"
    t.integer  "missed_putt_short"
    t.integer  "penalties"
    t.integer  "course_id"
    t.integer  "three_putts"
    t.decimal  "handicap_differential", precision: 3, scale: 1
    t.decimal  "differential",          precision: 3, scale: 1
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id"
  add_index "rounds", ["user_id"], name: "index_rounds_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
