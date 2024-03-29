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

ActiveRecord::Schema.define(:version => 20120821073622) do

  create_table "angelships", :force => true do |t|
    t.integer  "angel_id"
    t.integer  "dreamer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "angelships", ["angel_id", "dreamer_id"], :name => "index_angelships_on_angel_id_and_dreamer_id", :unique => true
  add_index "angelships", ["angel_id"], :name => "index_angelships_on_angel_id"
  add_index "angelships", ["dreamer_id"], :name => "index_angelships_on_dreamer_id"

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "goal_post_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["goal_post_id"], :name => "index_comments_on_goal_post_id"

  create_table "goal_posts", :force => true do |t|
    t.string   "summary"
    t.string   "tgoal"
    t.integer  "goal_id"
    t.integer  "user_id"
    t.string   "like"
    t.string   "support"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "goal_posts", ["goal_id"], :name => "index_goal_posts_on_goal_id"

  create_table "goals", :force => true do |t|
    t.string   "name"
    t.text     "statement"
    t.date     "startdate"
    t.date     "enddate"
    t.boolean  "current",    :default => false
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pictures", ["imageable_id", "imageable_type"], :name => "index_pictures_on_imageable_id_and_imageable_type"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "uid",                                    :null => false
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "avatar"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true

end
