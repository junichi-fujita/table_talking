ActiveRecord::Schema.define(version: 2020_08_11_015943) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "race", default: 0, null: false
    t.integer "job", default: 0, null: false
    t.integer "level", default: 1, null: false
    t.integer "strength", default: 1, null: false
    t.integer "agility", default: 1, null: false
    t.integer "intelligence", default: 1, null: false
    t.integer "money", default: 0, null: false
    t.text "stock"
    t.integer "experience", default: 0, null: false
    t.integer "max_hit_point", default: 10, null: false
    t.integer "current_hit_point", default: 10, null: false
    t.integer "max_magic_point", default: 10, null: false
    t.integer "current_magic_point", default: 10, null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "evasion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "play_room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_room_id"], name: "index_chats_on_play_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "participant_managements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recruitment_id", null: false
    t.boolean "acceptance", default: false, null: false
    t.integer "application"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruitment_id"], name: "index_participant_managements_on_recruitment_id"
    t.index ["user_id"], name: "index_participant_managements_on_user_id"
  end

  create_table "play_rooms", force: :cascade do |t|
    t.string "room_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruitments", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.integer "appropriate_level", null: false
    t.string "master_name", null: false
    t.datetime "start_time", null: false
    t.integer "play_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "play_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_room_id"], name: "index_user_rooms_on_play_room_id"
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "icon"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "play_rooms"
  add_foreign_key "chats", "users"
  add_foreign_key "user_rooms", "play_rooms"
  add_foreign_key "user_rooms", "users"
end
