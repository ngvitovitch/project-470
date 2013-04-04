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

ActiveRecord::Schema.define(:version => 20130404040704) do

  create_table "bill_payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bill_id"
    t.float    "amount"
    t.string   "method"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bill_payments", ["bill_id"], :name => "index_bill_payments_on_bill_id"
  add_index "bill_payments", ["user_id"], :name => "index_bill_payments_on_user_id"

  create_table "bills", :force => true do |t|
    t.string   "name"
    t.string   "owed_to"
    t.float    "amount"
    t.date     "date_due"
    t.string   "status"
    t.integer  "dwelling_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "dwellings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "owner_id"
    t.string   "time_zone",  :default => "UTC"
  end

  create_table "events", :force => true do |t|
    t.integer  "dwelling_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["dwelling_id"], :name => "index_events_on_dwelling_id"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "invites", :force => true do |t|
    t.string   "token"
    t.string   "email"
    t.integer  "dwelling_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "invites", ["dwelling_id"], :name => "index_invites_on_dwelling_id"

  create_table "shopping_list_items", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "obligate_id"
    t.integer  "obligates"
    t.boolean  "status"
    t.integer  "shopping_list_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "shopping_lists", :force => true do |t|
    t.string   "title"
    t.integer  "dwelling_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "dwelling_id"
  end

end
