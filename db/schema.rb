# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_16_000815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.bigint "strain_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["strain_id"], name: "index_collections_on_strain_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.integer "rating"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.bigint "vendor_id", null: false
    t.string "review"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "smoke_list_id"
    t.index ["collection_id"], name: "index_entries_on_collection_id"
    t.index ["smoke_list_id"], name: "index_entries_on_smoke_list_id"
    t.index ["vendor_id"], name: "index_entries_on_vendor_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "smoke_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "entry_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entry_id"], name: "index_smoke_lists_on_entry_id"
    t.index ["user_id"], name: "index_smoke_lists_on_user_id"
  end

  create_table "strains", force: :cascade do |t|
    t.string "name"
    t.string "genus"
    t.string "flavorList"
    t.string "description"
    t.text "cannabinoidList"
    t.text "terpeneList"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "effects"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_tags_on_collection_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "profileDescription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

  add_foreign_key "collections", "strains"
  add_foreign_key "collections", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "entries", "collections"
  add_foreign_key "entries", "vendors"
  add_foreign_key "likes", "users"
  add_foreign_key "smoke_lists", "entries"
  add_foreign_key "smoke_lists", "users"
  add_foreign_key "tags", "collections"
  add_foreign_key "vendors", "users"
end
