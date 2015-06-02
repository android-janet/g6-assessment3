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

ActiveRecord::Schema.define(version: 20150602155556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classes", force: :cascade do |t|
    t.string  "subject"
    t.integer "instructor_id"
    t.integer "student_id"
  end

  add_index "classes", ["instructor_id"], name: "index_classes_on_instructor_id", using: :btree
  add_index "classes", ["student_id"], name: "index_classes_on_student_id", using: :btree

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "classes", "instructors"
  add_foreign_key "classes", "students"
end
