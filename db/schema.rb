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

ActiveRecord::Schema.define(version: 20161117205404) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "attending_event_id"
    t.integer  "attendee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
    t.index ["attending_event_id"], name: "index_attendances_on_attending_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.date     "date"
    t.integer  "creator_id"
    t.integer  "attendees_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["attendees_id"], name: "index_events_on_attendees_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "attending_events_id"
    t.integer  "hosting_events_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["attending_events_id"], name: "index_users_on_attending_events_id"
    t.index ["hosting_events_id"], name: "index_users_on_hosting_events_id"
  end

end
