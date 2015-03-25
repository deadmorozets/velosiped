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

ActiveRecord::Schema.define(version: 20150302190935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "occupations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: true do |t|
    t.integer  "person_id"
    t.decimal  "duration"
    t.date     "finish_date"
    t.decimal  "cost"
    t.boolean  "signed"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "operations", ["order_id"], name: "index_operations_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.date     "etc_date"
    t.date     "finish_date"
    t.boolean  "signed"
    t.date     "start_date"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "orders", ["person_id"], name: "index_orders_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.integer  "occupation_id"
    t.string   "first_name"
    t.integer  "post"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["occupation_id"], name: "index_people_on_occupation_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
