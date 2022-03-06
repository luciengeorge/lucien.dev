# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_01_193604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "commits", force: :cascade do |t|
    t.bigint "contributor_id"
    t.bigint "repo_id", null: false
    t.text "message"
    t.string "sha"
    t.string "url"
    t.string "html_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "pushed_at", precision: nil
    t.index ["contributor_id"], name: "index_commits_on_contributor_id"
    t.index ["repo_id"], name: "index_commits_on_repo_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.string "login"
    t.string "avatar_url"
    t.string "profile_url"
    t.string "followers_url"
    t.string "following_url"
    t.string "starred_url"
    t.integer "gh_id"
    t.string "gh_type"
    t.string "api_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "degree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_educations_on_school_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.integer "job_type", default: 0, null: false
    t.integer "rank"
    t.boolean "hidden", default: false, null: false
    t.index ["company_id"], name: "index_experiences_on_company_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "repo_contributors", force: :cascade do |t|
    t.bigint "repo_id", null: false
    t.bigint "contributor_id", null: false
    t.integer "contribution_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_repo_contributors_on_contributor_id"
    t.index ["repo_id"], name: "index_repo_contributors_on_repo_id"
  end

  create_table "repo_languages", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.bigint "repo_id", null: false
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_repo_languages_on_language_id"
    t.index ["repo_id"], name: "index_repo_languages_on_repo_id"
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.boolean "private"
    t.jsonb "owner"
    t.string "html_url"
    t.string "api_url"
    t.boolean "fork"
    t.datetime "pushed_at", precision: nil
    t.string "git_url"
    t.string "homepage"
    t.integer "size"
    t.integer "stars"
    t.integer "forks"
    t.integer "open_issues"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gh_id"
    t.integer "commits_count"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.boolean "admin", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "websites", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.string "url"
    t.bigint "repo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repo_id"], name: "index_websites_on_repo_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "commits", "contributors"
  add_foreign_key "commits", "repos"
  add_foreign_key "educations", "schools"
  add_foreign_key "experiences", "companies"
  add_foreign_key "repo_contributors", "contributors"
  add_foreign_key "repo_contributors", "repos"
  add_foreign_key "repo_languages", "languages"
  add_foreign_key "repo_languages", "repos"
  add_foreign_key "websites", "repos"
end
