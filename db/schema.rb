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

ActiveRecord::Schema.define(:version => 20130202162156) do

  create_table "agencies", :force => true do |t|
    t.string   "agency_phone"
    t.string   "agency_url"
    t.string   "agency_id"
    t.string   "agency_name"
    t.string   "agency_timezone"
    t.string   "agency_lang"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "calendar_dates", :force => true do |t|
    t.string   "service_id"
    t.datetime "date"
    t.integer  "exception_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "calendars", :force => true do |t|
    t.string   "service_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fare_attributes", :force => true do |t|
    t.string   "fare_id"
    t.float    "price"
    t.string   "currency_type"
    t.integer  "payment_method"
    t.integer  "transfers"
    t.integer  "transfer_duration"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "routes", :force => true do |t|
    t.string   "route_long_name"
    t.integer  "route_id"
    t.integer  "route_type"
    t.string   "route_text_color"
    t.string   "agency_id"
    t.string   "route_color"
    t.string   "route_url"
    t.string   "route_short_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "shapes", :force => true do |t|
    t.string   "shape_id"
    t.float    "shape_pt_lat"
    t.float    "shape_pt_lon"
    t.integer  "shape_pt_sequence"
    t.float    "shape_dist_traveled"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "stop_times", :force => true do |t|
    t.string   "trip_id"
    t.datetime "arrival_time"
    t.datetime "departure_time"
    t.string   "stop_id"
    t.integer  "stop_sequence"
    t.string   "stop_headsign"
    t.integer  "pickup_type"
    t.integer  "drop_off_type"
    t.float    "shape_dist_traveled"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "stops", :force => true do |t|
    t.float    "stop_lat"
    t.string   "zone_id"
    t.float    "stop_lon"
    t.string   "stop_id"
    t.string   "stop_desc"
    t.string   "stop_name"
    t.integer  "location_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "trips", :force => true do |t|
    t.string   "block_id"
    t.string   "route_id"
    t.string   "trip_headsign"
    t.string   "service_id"
    t.string   "shape_id"
    t.string   "trip_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
