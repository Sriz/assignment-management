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

ActiveRecord::Schema.define(version: 20140107225806) do

  create_table "admin_users", force: true do |t|
    t.string   "username",        limit: 25
    t.string   "email",           limit: 100
    t.string   "hashed_password",             default: "", null: false
    t.string   "salt",            limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "admin_users_pages", id: false, force: true do |t|
    t.integer "admin_user_id"
    t.integer "page_id"
  end

  add_index "admin_users_pages", ["admin_user_id", "page_id"], name: "index_admin_users_pages_on_admin_user_id_and_page_id", using: :btree

  create_table "assignment_edits", force: true do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.string   "summary"
    t.string   "assignment_edits_file_name"
    t.string   "assignment_edits_content_type"
    t.integer  "assignment_edits_file_size"
    t.datetime "assignment_edits_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignment_edits", ["subject_id"], name: "index_assignment_edits_on_subject_id", using: :btree
  add_index "assignment_edits", ["user_id", "assignment_id"], name: "index_assignment_edits_on_user_id_and_assignment_id", using: :btree

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.string   "title",                    limit: 100, default: "", null: false
    t.text     "body",                                              null: false
    t.datetime "created_at"
    t.datetime "deadline"
    t.integer  "marks"
    t.string   "assignments_file_name"
    t.string   "assignments_content_type"
    t.integer  "assignments_file_size"
    t.datetime "assignments_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "assignments", ["subject_id"], name: "index_assignments_on_subject_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.string   "permalink"
    t.integer  "semester"
    t.boolean  "visible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree
  add_index "pages", ["subject_id"], name: "index_pages_on_subject_id", using: :btree

  create_table "section_edits", force: true do |t|
    t.integer  "admin_user_id"
    t.integer  "section_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_edits", ["admin_user_id", "section_id"], name: "index_section_edits_on_admin_user_id_and_section_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.integer  "semester"
    t.boolean  "visible",      default: false
    t.string   "content_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "phone"
    t.string   "student_category_id"
    t.string   "address"
    t.string   "city"
    t.string   "email"
    t.string   "photo_filename"
    t.string   "photo_content_type"
    t.binary   "photo_data"
    t.integer  "photo_file_size"
    t.string   "students_file_name"
    t.string   "students_content_type"
    t.integer  "students_file_size"
    t.datetime "students_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "semester"
    t.boolean  "visible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "email"
    t.string   "students_file_name"
    t.string   "students_content_type"
    t.integer  "students_file_size"
    t.datetime "students_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "phone"
    t.string   "student_category_id"
    t.string   "address"
    t.string   "city"
    t.string   "students_file_name"
    t.string   "students_content_type"
    t.integer  "students_file_size"
    t.datetime "students_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
