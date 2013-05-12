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

ActiveRecord::Schema.define(:version => 20130512180521) do

  create_table "friendships", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["friend_id", "user_id"], :name => "index_friendships_on_friend_id_and_user_id", :unique => true
  add_index "friendships", ["user_id", "friend_id"], :name => "index_friendships_on_user_id_and_friend_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "desc"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "post_interface_id"
    t.string   "post_interface_type"
  end

  add_index "posts", ["post_interface_id"], :name => "index_posts_on_post_interface_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "researcher_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "description"
  end

  add_index "projects", ["researcher_id"], :name => "index_projects_on_Researcher_id"

  create_table "projects_researchers", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "researcher_id"
  end

  create_table "researchers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "resources", :force => true do |t|
    t.integer  "type"
    t.string   "value"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "resource_interface_id"
    t.string   "resource_interface_type"
  end

  add_index "resources", ["resource_interface_id"], :name => "index_resources_on_resource_interface_id"

  create_table "tasks", :force => true do |t|
    t.integer  "type"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
