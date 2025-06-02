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

ActiveRecord::Schema[7.1].define(version: 2025_06_02_091559) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "emergency_modules", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.index ["user_id"], name: "index_emergency_modules_on_user_id"
  end

  create_table "emergency_pages", force: :cascade do |t|
    t.string "title"
    t.text "step"
    t.bigint "emergency_topic_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.index ["emergency_topic_id"], name: "index_emergency_pages_on_emergency_topic_id"
    t.index ["user_id"], name: "index_emergency_pages_on_user_id"
  end

  create_table "emergency_topics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "emergency_module_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.index ["emergency_module_id"], name: "index_emergency_topics_on_emergency_module_id"
    t.index ["user_id"], name: "index_emergency_topics_on_user_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_aid_maps", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_modules", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_pages", force: :cascade do |t|
    t.string "title"
    t.text "step"
    t.boolean "active"
    t.bigint "training_topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_topic_id"], name: "index_training_pages_on_training_topic_id"
  end

  create_table "training_progresses", force: :cascade do |t|
    t.string "state"
    t.bigint "user_id", null: false
    t.bigint "training_topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_topic_id"], name: "index_training_progresses_on_training_topic_id"
    t.index ["user_id"], name: "index_training_progresses_on_user_id"
  end

  create_table "training_topics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.bigint "training_module_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_module_id"], name: "index_training_topics_on_training_module_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "emergency_modules", "users"
  add_foreign_key "emergency_pages", "emergency_topics"
  add_foreign_key "emergency_pages", "users"
  add_foreign_key "emergency_topics", "emergency_modules"
  add_foreign_key "emergency_topics", "users"
  add_foreign_key "training_pages", "training_topics"
  add_foreign_key "training_progresses", "training_topics"
  add_foreign_key "training_progresses", "users"
  add_foreign_key "training_topics", "training_modules"
end
