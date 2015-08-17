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

ActiveRecord::Schema.define(version: 20150817143931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "indicator_id"
    t.integer  "student_id"
    t.integer  "assessor_id"
    t.string   "assessor_type"
    t.text     "notes"
    t.integer  "mark"
    t.integer  "out_of"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug"
    t.integer  "teacher_id"
  end

  add_index "groups", ["slug"], name: "index_groups_on_slug", using: :btree
  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id", using: :btree

  create_table "indicator_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "indicator_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "indicator_anc_desc_idx", unique: true, using: :btree
  add_index "indicator_hierarchies", ["descendant_id"], name: "indicator_desc_idx", using: :btree

  create_table "indicators", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "position"
    t.integer  "curriculum_id"
    t.integer  "parent_id"
    t.string   "type"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "group_id"
    t.text     "notes"
    t.date     "lesson_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "teacher_id"
    t.integer  "subject_id"
  end

  add_index "lessons", ["group_id"], name: "index_lessons_on_group_id", using: :btree

  create_table "objectives", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "stream"
    t.integer  "indicator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "objectives", ["lesson_id"], name: "index_objectives_on_lesson_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
    t.integer  "group_id"
    t.string   "slug"
  end

  add_index "students", ["deleted_at"], name: "index_students_on_deleted_at", using: :btree
  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",                  default: 0
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree
  add_index "teachers", ["invitation_token"], name: "index_teachers_on_invitation_token", unique: true, using: :btree
  add_index "teachers", ["invitations_count"], name: "index_teachers_on_invitations_count", using: :btree
  add_index "teachers", ["invited_by_id"], name: "index_teachers_on_invited_by_id", using: :btree
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree

end
