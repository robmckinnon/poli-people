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

ActiveRecord::Schema.define(:version => 20100108185305) do

  create_table "uk2010_constituencies", :force => true do |t|
    t.string  "name"
    t.string  "alternate_name"
    t.string  "wikipedia_uri"
    t.integer "uk_country_id"
    t.integer "uk_region_id"
  end

  add_index "uk2010_constituencies", ["uk_country_id"], :name => "index_uk2010_constituencies_on_uk_country_id"
  add_index "uk2010_constituencies", ["uk_region_id"], :name => "index_uk2010_constituencies_on_uk_region_id"

  create_table "uk_countries", :force => true do |t|
    t.string "name"
    t.string "wikipedia_uri"
  end

  create_table "uk_regions", :force => true do |t|
    t.string  "name"
    t.string  "wikipedia_uri"
    t.integer "uk_country_id"
  end

  add_index "uk_regions", ["uk_country_id"], :name => "index_uk_regions_on_uk_country_id"

end
