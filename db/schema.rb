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

ActiveRecord::Schema[7.0].define(version: 2022_07_30_055158) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_translations", force: :cascade do |t|
    t.bigint "about_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "subtitle"
    t.text "advantages"
    t.text "benefits"
    t.index ["about_id"], name: "index_about_translations_on_about_id"
    t.index ["locale"], name: "index_about_translations_on_locale"
  end

  create_table "abouts", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "advantages"
    t.text "benefits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "super_admin", default: 0
  end

  create_table "authorizations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "compares", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "residence_id"
    t.bigint "user_id"
    t.index ["residence_id"], name: "index_compares_on_residence_id"
    t.index ["user_id"], name: "index_compares_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "location"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
  end

  create_table "country_translations", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "content"
    t.index ["country_id"], name: "index_country_translations_on_country_id"
    t.index ["locale"], name: "index_country_translations_on_locale"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "residence_id"
    t.bigint "user_id"
    t.index ["residence_id"], name: "index_likes_on_residence_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "residence_id"
    t.integer "status", default: 0
    t.integer "messenger", default: 0
    t.index ["residence_id"], name: "index_orders_on_residence_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "post_translations", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "content"
    t.index ["locale"], name: "index_post_translations_on_locale"
    t.index ["post_id"], name: "index_post_translations_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_translations", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "content"
    t.index ["locale"], name: "index_program_translations_on_locale"
    t.index ["program_id"], name: "index_program_translations_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.bigint "country_id", null: false
    t.string "kind"
    t.index ["country_id"], name: "index_programs_on_country_id"
  end

  create_table "residence_translations", force: :cascade do |t|
    t.bigint "residence_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.text "pros"
    t.text "main_info"
    t.index ["locale"], name: "index_residence_translations_on_locale"
    t.index ["residence_id"], name: "index_residence_translations_on_residence_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "program_id"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.text "pros"
    t.integer "bedroom"
    t.integer "bathroom"
    t.float "squarefeet"
    t.integer "rooms"
    t.string "cost"
    t.text "main_info"
    t.index ["country_id"], name: "index_residences_on_country_id"
    t.index ["program_id"], name: "index_residences_on_program_id"
  end

  create_table "testimonial_translations", force: :cascade do |t|
    t.bigint "testimonial_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_of_user"
    t.text "content"
    t.index ["locale"], name: "index_testimonial_translations_on_locale"
    t.index ["testimonial_id"], name: "index_testimonial_translations_on_testimonial_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "name_of_user"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 50, default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "residence_id"
    t.bigint "user_id"
    t.index ["residence_id"], name: "index_views_on_residence_id"
    t.index ["user_id"], name: "index_views_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "authorizations", "users", on_delete: :cascade
  add_foreign_key "programs", "countries"
end
