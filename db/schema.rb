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

ActiveRecord::Schema.define(:version => 20121107182325) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.string   "first_address"
    t.string   "second_address"
    t.string   "third_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "first_phone"
    t.string   "second_phone"
    t.string   "first_fax"
    t.string   "second_fax"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects", ["company_id"], :name => "index_projects_on_company_id"

  create_table "roles", :force => true do |t|
    t.string   "role_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "timers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "duration",          :default => 0.0
    t.string   "description"
    t.datetime "last_activated_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "timers", ["project_id"], :name => "index_timers_on_project_id"
  add_index "timers", ["user_id"], :name => "index_timers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "remember_token"
    t.integer  "role",            :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
