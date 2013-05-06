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

ActiveRecord::Schema.define(:version => 20130506093950) do

  create_table "damselfly_attachments", :force => true do |t|
    t.string   "association_name"
    t.string   "filename"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "file_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "damselfly_attachments", ["attachable_id", "attachable_type"], :name => "index_damselfly_on_attachable"
  add_index "damselfly_attachments", ["file_id"], :name => "index_damselfly_attachments_on_file_id"

  create_table "damselfly_files", :force => true do |t|
    t.string  "file_uid"
    t.string  "md5"
    t.integer "size"
  end

  add_index "damselfly_files", ["md5", "size"], :name => "index_damselfly_files_on_md5_and_size", :unique => true

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
