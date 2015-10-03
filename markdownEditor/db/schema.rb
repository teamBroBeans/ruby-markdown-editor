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

ActiveRecord::Schema.define(version: 20151002035125) do

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.string   "tag"
    t.string   "inputText"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "note_id"
    t.integer  "tag_id"
  end

  add_index "notes_tags", ["note_id"], name: "index_notes_tags_on_note_id"
  add_index "notes_tags", ["tag_id"], name: "index_notes_tags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
