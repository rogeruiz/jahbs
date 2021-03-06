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

ActiveRecord::Schema.define(version: 20120714222426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animated_gifs", force: true do |t|
    t.string   "image"
    t.text     "shas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "git_commits", force: true do |t|
    t.string   "image"
    t.string   "sha"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "repo_id"
    t.string   "raw"
  end

  add_index "git_commits", ["email"], name: "index_git_commits_on_email", using: :btree
  add_index "git_commits", ["repo_id"], name: "index_git_commits_on_repo_id", using: :btree
  add_index "git_commits", ["sha"], name: "index_git_commits_on_sha", using: :btree
  add_index "git_commits", ["user_id"], name: "index_git_commits_on_user_id", using: :btree

  create_table "repos", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_id"
  end

  add_index "repos", ["external_id"], name: "index_repos_on_external_id", using: :btree
  add_index "repos", ["username", "name"], name: "index_repos_on_username_and_name", using: :btree

  create_table "repos_users", id: false, force: true do |t|
    t.integer "repo_id"
    t.integer "user_id"
  end

  add_index "repos_users", ["repo_id", "user_id"], name: "index_repos_users_on_repo_id_and_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "github_id"
    t.string   "email"
    t.string   "token"
    t.string   "api_key"
    t.string   "api_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["api_key"], name: "index_users_on_api_key", using: :btree
  add_index "users", ["github_id"], name: "index_users_on_github_id", using: :btree

end
