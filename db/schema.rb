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

ActiveRecord::Schema.define(version: 20180108141538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer  "workers_id"
    t.string   "city_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["workers_id"], name: "index_cities_on_workers_id", using: :btree

  create_table "professions", force: :cascade do |t|
    t.integer  "workers_id"
    t.string   "prof_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professions", ["workers_id"], name: "index_professions_on_workers_id", using: :btree

  create_table "workers", force: :cascade do |t|
    t.string   "fio"
    t.string   "email"
    t.string   "phone"
    t.string   "photo_url"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
