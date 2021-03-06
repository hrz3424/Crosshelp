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

ActiveRecord::Schema.define(version: 2018_06_01_023759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", id: :serial, force: :cascade do |t|
    t.string "action_type", null: false
    t.string "action_option"
    t.string "target_type"
    t.integer "target_id"
    t.string "user_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_type", "target_id", "action_type"], name: "index_actions_on_target_type_and_target_id_and_action_type"
    t.index ["user_type", "user_id", "action_type"], name: "index_actions_on_user_type_and_user_id_and_action_type"
  end

  create_table "activities", force: :cascade do |t|
    t.integer "user_id"
    t.string "poster"
    t.string "title"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "body"
    t.datetime "deadline"
    t.integer "cpropertyids", default: [], array: true
    t.integer "itemids", default: [], array: true
  end

  create_table "activityfees", force: :cascade do |t|
    t.integer "activity_id"
    t.string "name"
    t.decimal "money", precision: 6, scale: 2
    t.integer "quota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "sex"
    t.string "head"
    t.date "begin_work_date"
    t.date "birthday"
    t.string "phone"
    t.string "job_status"
    t.text "advantage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
  end

  create_table "applicants_jobmanages", id: false, force: :cascade do |t|
    t.bigint "jobmanage_id", null: false
    t.bigint "applicant_id", null: false
    t.index ["applicant_id", "jobmanage_id"], name: "index_applicants_jobmanages_on_applicant_id_and_jobmanage_id"
    t.index ["jobmanage_id", "applicant_id"], name: "index_applicants_jobmanages_on_jobmanage_id_and_applicant_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "author"
    t.string "image"
    t.string "order_index"
    t.boolean "hidden", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "friend_ids", default: [], array: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count", default: 0
    t.integer "post_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.string "logo"
    t.string "address"
    t.string "industry"
    t.string "website"
    t.string "mailbox"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cproperties", force: :cascade do |t|
    t.string "keyname"
    t.string "keytype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educationexperiences", force: :cascade do |t|
    t.integer "applicant_id"
    t.string "school"
    t.string "major"
    t.string "education"
    t.date "begin_date"
    t.date "end_date"
    t.text "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enters", force: :cascade do |t|
    t.integer "activity_id"
    t.json "content", default: {}
    t.string "name"
    t.string "phone"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "activityfee_id"
  end

  create_table "expectjobs", force: :cascade do |t|
    t.integer "applicant_id"
    t.string "industry"
    t.string "job"
    t.string "city"
    t.string "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "parent_id", default: 0
    t.string "name"
    t.integer "level", default: 0
    t.integer "sort", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobmanages", force: :cascade do |t|
    t.integer "user_id"
    t.string "company_name"
    t.string "position"
    t.string "address"
    t.string "kind"
    t.string "ability"
    t.string "salary"
    t.string "experience"
    t.string "education"
    t.text "workcontent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "state", default: "normal"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "parent_id", default: 0
    t.string "name"
    t.integer "level", default: 0
    t.integer "sort", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_jobs_on_parent_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "tag"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "label_id", null: false
    t.index ["label_id", "user_id"], name: "index_labels_users_on_label_id_and_user_id"
    t.index ["user_id", "label_id"], name: "index_labels_users_on_user_id_and_label_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "paytime"
    t.string "state", default: "created"
    t.decimal "sum", precision: 6, scale: 2
    t.decimal "factsum", precision: 6, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count", default: 0
    t.integer "stars_count", default: 0
    t.integer "comments_count", default: 0
  end

  create_table "projectexperiences", force: :cascade do |t|
    t.integer "applicant_id"
    t.string "project_name"
    t.string "project_connect"
    t.string "employment"
    t.string "role"
    t.date "begin_date"
    t.date "end_date"
    t.text "project_content"
    t.text "performance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "enter_id"
    t.integer "order_id"
    t.integer "activity_id"
    t.string "state", default: "created"
    t.string "code"
    t.string "Qrcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "remark"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone", limit: 11
    t.string "open_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "job", default: false
    t.string "profession"
    t.integer "vipercount", default: 2
    t.string "badge"
    t.string "company"
    t.string "sex"
    t.date "birthday"
    t.string "province"
    t.string "city"
    t.string "school"
    t.string "industry"
    t.text "summary"
    t.string "business_licence"
    t.integer "star_posts_count", default: 0
    t.integer "followers_count", default: 0
    t.integer "following_count", default: 0
    t.string "photo"
    t.string "card"
    t.integer "company_id"
    t.string "viper", default: "normal"
    t.string "corporater", default: "normal"
    t.string "authentication", default: "normal"
    t.string "holdoffice"
    t.string "remark"
    t.string "imtoken"
    t.decimal "balance", precision: 6, scale: 2
    t.integer "activityids", default: [], array: true
    t.integer "collection_ids", default: [], array: true
    t.integer "follow_ids", default: [], array: true
    t.string "recruit", default: "normal"
    t.index ["open_id"], name: "index_users_on_open_id"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["token"], name: "index_users_on_token"
  end

  create_table "workexperiences", force: :cascade do |t|
    t.integer "applicant_id"
    t.string "position"
    t.string "department"
    t.string "company_name"
    t.date "begin_date"
    t.date "end_date"
    t.text "job_content"
    t.text "performance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
