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

ActiveRecord::Schema.define(:version => 20110831173027) do

  create_table "bookmarks", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "q_review"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "bookmark_id"
    t.integer  "user_id"
    t.boolean  "flagged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["bookmark_id"], :name => "index_comments_on_bookmark_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "cups", :force => true do |t|
    t.integer  "size"
    t.string   "colour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "bookmark_id", :null => false
    t.integer  "stars"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["bookmark_id"], :name => "index_ratings_on_bookmark_id"

  create_table "taggings", :force => true do |t|
    t.integer  "bookmark_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        :default => false
    t.string   "salt"
    t.string   "hashed_password"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
