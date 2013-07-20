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

ActiveRecord::Schema.define(version: 20130720123358) do

  create_table "admins", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "assessments", force: true do |t|
    t.text     "Complaints"
    t.text     "Clinical"
    t.text     "Investigation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
  end

  create_table "followups", force: true do |t|
    t.date     "Date"
    t.text     "ClinicalPicture"
    t.text     "Plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
  end

  create_table "patients", force: true do |t|
    t.text     "Name"
    t.integer  "Contact"
    t.text     "Email"
    t.text     "Address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practices", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "staffs", force: true do |t|
    t.string   "name"
    t.string   "qualification"
    t.string   "biography"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
