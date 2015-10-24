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

ActiveRecord::Schema.define(version: 20150910082555) do

  create_table "access_logs", force: :cascade do |t|
    t.integer  "mailform_id"
    t.string   "key"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "mailform_history_id"
  end

  create_table "mailform_histories", force: :cascade do |t|
    t.integer  "mailform_id"
    t.string   "sender"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mailforms", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "sender"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "to"
    t.boolean  "is_hidden"
    t.string   "landing_page"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sent_logs", force: :cascade do |t|
    t.integer  "mailform_id"
    t.string   "to"
    t.string   "key"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "mailform_history_id"
  end

end
