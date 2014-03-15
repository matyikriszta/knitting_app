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

ActiveRecord::Schema.define(:version => 20140315131516) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patterns", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "status"
    t.integer  "no_of_rows"
    t.string   "difficulty"
    t.string   "description"
    t.text     "instructions"
    t.text     "notes"
    t.string   "yarn"
    t.string   "equipment"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "patterns", ["category_id"], :name => "index_patterns_on_category_id"
  add_index "patterns", ["user_id"], :name => "index_patterns_on_user_id"

  create_table "rows", :force => true do |t|
    t.integer  "pattern_id"
    t.integer  "no_of_stitches"
    t.integer  "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rows", ["pattern_id"], :name => "index_rows_on_pattern_id"

  create_table "stitches", :force => true do |t|
    t.integer  "row_id"
    t.string   "color"
    t.string   "type"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stitches", ["row_id"], :name => "index_stitches_on_row_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "user_image"
    t.string   "membership",             :default => "basic"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "email",                  :default => "",      :null => false
    t.string   "encrypted_password",     :default => "",      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,       :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
