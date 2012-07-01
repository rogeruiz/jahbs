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

ActiveRecord::Schema.define(:version => 20120630211101) do

  create_table "animated_gifs", :force => true do |t|
    t.string   "image"
    t.text     "shas"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "git_commits", :force => true do |t|
    t.string   "image"
    t.string   "sha"
    t.string   "repo"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "git_commits", ["email"], :name => "index_git_commits_on_email"
  add_index "git_commits", ["repo", "sha"], :name => "index_git_commits_on_repo_and_sha"
  add_index "git_commits", ["sha"], :name => "index_git_commits_on_sha"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "github_id"
    t.string   "email"
    t.string   "token"
    t.string   "api_key"
    t.string   "api_secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["api_key"], :name => "index_users_on_api_key"
  add_index "users", ["github_id"], :name => "index_users_on_github_id"

end
