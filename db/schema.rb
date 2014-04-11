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

ActiveRecord::Schema.define(:version => 20140411113832) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "colors", :force => true do |t|
    t.integer  "pattern_id"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "default"
  end

  add_index "colors", ["pattern_id"], :name => "index_colors_on_pattern_id"

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          :default => 0, :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "difficulties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patterns", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "no_of_rows"
    t.string   "description"
    t.text     "instructions"
    t.text     "notes"
    t.string   "yarn"
    t.string   "equipment"
    t.integer  "category_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "difficulty_id"
    t.string   "sequence"
    t.integer  "cached_votes_total",    :default => 0
    t.integer  "cached_votes_score",    :default => 0
    t.integer  "cached_votes_up",       :default => 0
    t.integer  "cached_votes_down",     :default => 0
    t.integer  "cached_weighted_score", :default => 0
  end

  add_index "patterns", ["cached_votes_down"], :name => "index_patterns_on_cached_votes_down"
  add_index "patterns", ["cached_votes_score"], :name => "index_patterns_on_cached_votes_score"
  add_index "patterns", ["cached_votes_total"], :name => "index_patterns_on_cached_votes_total"
  add_index "patterns", ["cached_votes_up"], :name => "index_patterns_on_cached_votes_up"
  add_index "patterns", ["cached_weighted_score"], :name => "index_patterns_on_cached_weighted_score"
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
    t.integer "row_id",   :null => false
    t.string  "color"
    t.string  "type"
    t.integer "position"
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
    t.string   "role"
    t.text     "description"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
