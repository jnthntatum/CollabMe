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

ActiveRecord::Schema.define(:version => 20130606215831) do

  create_table "activities", :force => true do |t|
    t.integer  "work_experience_id"
    t.string   "activity"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "authors"
    t.string   "publisher"
    t.integer  "citations"
    t.integer  "year"
    t.string   "full_article_url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "authorid"
    t.integer  "aid"
  end

  create_table "chat_sessions", :force => true do |t|
    t.integer  "userA_id"
    t.integer  "userB_id"
    t.string   "messages_blob"
    t.string   "drawables_blob"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.integer  "education_id"
    t.string   "course_title"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "educations", :force => true do |t|
    t.integer  "researcher_id"
    t.integer  "school_id"
    t.string   "degree"
    t.string   "major"
    t.string   "specialization"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "photos", :force => true do |t|
    t.string   "file_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "photo_interface_id"
    t.string   "photo_interface_type"
  end

  add_index "photos", ["photo_interface_id"], :name => "index_photos_on_photo_interface_id"

  create_table "posts", :force => true do |t|
    t.string   "desc"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "post_interface_id"
    t.string   "post_interface_type"
    t.string   "title"
    t.integer  "creator_id"
  end

  add_index "posts", ["post_interface_id"], :name => "index_posts_on_post_interface_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "researcher_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "description"
  end

  add_index "projects", ["researcher_id"], :name => "index_projects_on_researcher_id"

  create_table "projects_researchers", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "researcher_id"
  end

  create_table "requests", :force => true do |t|
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "request_interface_id"
    t.string   "request_interface_type"
    t.integer  "owner_id"
  end

  add_index "requests", ["request_interface_id"], :name => "index_requests_on_request_interface_id"

  create_table "research_group_members", :id => false, :force => true do |t|
    t.integer  "researcher_id"
    t.integer  "group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "research_group_members", ["group_id", "researcher_id"], :name => "group_members_index", :unique => true
  add_index "research_group_members", ["researcher_id", "group_id"], :name => "member_groups_index", :unique => true

  create_table "research_labs", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "focus"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "researchers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "salt"
    t.string   "password_digest"
    t.text     "about_me"
    t.text     "experience"
    t.text     "publications"
    t.integer  "citations"
    t.boolean  "published"
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

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "school_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "category"
    t.string   "desc"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "project_id"
    t.integer  "creator_id"
    t.integer  "assignee_id"
  end

  add_index "tasks", ["assignee_id"], :name => "index_tasks_on_assignee_id"
  add_index "tasks", ["creator_id"], :name => "index_tasks_on_creator_id"
  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"

  create_table "work_experiences", :force => true do |t|
    t.integer  "researcher_id"
    t.integer  "company_id"
    t.integer  "research_lab_id"
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
