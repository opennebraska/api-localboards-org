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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131123210631) do

  create_table "board_members", :force => true do |t|
    t.integer  "board_id"
    t.integer  "member_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "board_seat_id"
    t.boolean  "is_active"
  end

  create_table "board_seats", :force => true do |t|
    t.integer  "board_id"
    t.boolean  "alternate"
    t.text     "qualifications"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "term_notes"
    t.boolean  "is_active"
  end

  create_table "boards", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "title"
    t.integer  "seats"
    t.integer  "alternating_seats"
    t.text     "qualifications"
    t.integer  "department_id"
    t.string   "meeting_dates"
    t.string   "meeting_place"
    t.datetime "meeting_time"
    t.text     "duties"
    t.string   "url"
    t.integer  "term_length"
    t.boolean  "is_active"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "state_id"
    t.boolean  "is_active"
  end

  create_table "city_counties", :force => true do |t|
    t.integer  "city_id"
    t.integer  "county_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_active"
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "state_id"
    t.integer  "code_id"
    t.boolean  "is_active"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_active"
  end

  create_table "members", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_active"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "abbreviation"
    t.integer  "code_id"
    t.boolean  "is_active"
  end

end
