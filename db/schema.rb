# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100618200803) do

  create_table "farmers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "washing_station_id"
  end

  add_index "farmers", ["washing_station_id"], :name => "index_farmers_on_washing_station_id"

  create_table "farms", :force => true do |t|
    t.string   "name"
    t.boolean  "organic"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "altitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organic_certifier_id"
    t.integer  "farmer_id"
  end

  add_index "farms", ["farmer_id"], :name => "index_farms_on_farmer_id"
  add_index "farms", ["organic_certifier_id"], :name => "index_farms_on_organic_certifier_id"

  create_table "organic_certifiers", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "washing_stations", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
