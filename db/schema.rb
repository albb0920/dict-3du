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

ActiveRecord::Schema.define(:version => 20130127060159) do

  create_table "definitions", :force => true do |t|
    t.integer  "heteronym_id"
    t.integer  "type"
    t.string   "def"
    t.string   "example"
    t.integer  "see_entry_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "synonyms"
    t.string   "antonyms"
  end

  add_index "definitions", ["heteronym_id"], :name => "index_definations_on_heteronym_id"
  add_index "definitions", ["see_entry_id"], :name => "index_definations_on_see_entry_id"

  create_table "dicts", :force => true do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.string   "radical"
    t.integer  "stroke_count"
    t.integer  "non_radical_stroke_count"
    t.integer  "dict_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "entries", ["dict_id"], :name => "index_entries_on_dict_id"

  create_table "heteronyms", :force => true do |t|
    t.integer  "entry_id"
    t.string   "bopomofo"
    t.string   "bopomofo2"
    t.string   "pinyin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "heteronyms", ["entry_id"], :name => "index_heteronyms_on_word_id"

end
