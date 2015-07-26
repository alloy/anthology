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

ActiveRecord::Schema.define(version: 4) do

  create_table "cadres", force: :cascade do |t|
    t.string   "name"
    t.string   "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "feature"
    t.string   "objective"
    t.integer  "role_id"
    t.integer  "writer_id"
    t.integer  "cadre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stories", ["cadre_id"], name: "index_stories_on_cadre_id"
  add_index "stories", ["role_id"], name: "index_stories_on_role_id"
  add_index "stories", ["writer_id"], name: "index_stories_on_writer_id"

  create_table "writers", force: :cascade do |t|
    t.string   "name"
    t.integer  "cadre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "writers", ["cadre_id"], name: "index_writers_on_cadre_id"

end
