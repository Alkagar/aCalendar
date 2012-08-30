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

ActiveRecord::Schema.define(:version => 20120829204601) do

  create_table "configurations", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "task_attributes", :force => true do |t|
    t.integer  "task_id"
    t.integer  "task_type_attribute_id"
    t.text     "value"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "task_attributes", ["task_id"], :name => "index_task_attributes_on_task_id"
  add_index "task_attributes", ["task_type_attribute_id"], :name => "index_task_attributes_on_task_type_attribute_id"

  create_table "task_type_attributes", :force => true do |t|
    t.integer  "task_type_id"
    t.string   "name"
    t.text     "value"
    t.text     "default"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "task_type_attributes", ["task_type_id"], :name => "index_task_type_attributes_on_task_type_id"

  create_table "task_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "required"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "duration"
    t.integer  "user_id"
    t.datetime "begin"
    t.datetime "end"
    t.integer  "task_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "tasks", ["task_type_id"], :name => "index_tasks_on_task_type_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
