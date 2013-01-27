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

ActiveRecord::Schema.define(:version => 20130127071557) do

  create_table "definitions", :force => true do |t|
    t.integer  "heteronym_id"
    t.integer  "type"
    t.string   "def"
    t.string   "example"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "synonyms"
    t.string   "antonyms"
    t.string   "link_type"
    t.integer  "link_id"
  end

  add_index "definitions", ["heteronym_id"], :name => "index_definations_on_heteronym_id"

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

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
