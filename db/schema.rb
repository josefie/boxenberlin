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

ActiveRecord::Schema.define(version: 20131201210256) do

  create_table "boxers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.float    "weight"
    t.integer  "fights_won"
    t.integer  "fights_lost"
    t.integer  "fights_drawn"
    t.boolean  "gender"
    t.boolean  "active"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "performance_class_id"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "street_no"
    t.string   "zip"
    t.string   "city"
    t.string   "website"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "coaches", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coaches_trainings", id: false, force: true do |t|
    t.integer "training_id", null: false
    t.integer "coach_id",    null: false
  end

  add_index "coaches_trainings", ["coach_id"], name: "index_coaches_trainings_on_coach_id"
  add_index "coaches_trainings", ["training_id"], name: "index_coaches_trainings_on_training_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_mail"
    t.text     "additional_info"
    t.boolean  "gloves_available"
    t.boolean  "catering_available"
    t.decimal  "admission"
    t.decimal  "admission_discounted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "contact_name_public"
    t.boolean  "contact_phone_public"
    t.boolean  "contact_mail_public"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "club_id"
    t.decimal  "fee"
    t.boolean  "approved"
  end

  create_table "events_performance_classes", id: false, force: true do |t|
    t.integer "event_id",             null: false
    t.integer "performance_class_id", null: false
  end

  add_index "events_performance_classes", ["event_id"], name: "index_events_performance_classes_on_event_id"
  add_index "events_performance_classes", ["performance_class_id"], name: "index_events_performance_classes_on_performance_class_id"

  create_table "performance_classes", force: true do |t|
    t.string   "title"
    t.integer  "age_min"
    t.integer  "age_max"
    t.integer  "weight_min"
    t.integer  "weight_max"
    t.boolean  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_items", force: true do |t|
    t.string   "label"
    t.time     "time"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: true do |t|
    t.integer  "weekday"
    t.datetime "time_start"
    t.datetime "time_end"
    t.text     "description"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
