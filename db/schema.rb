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

ActiveRecord::Schema.define(version: 20171106122549) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",      default: "", null: false
    t.integer  "user_id"
    t.integer  "prototype_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["prototype_id"], name: "index_comments_on_prototype_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",        default: "", null: false
    t.integer  "prototype_id"
    t.integer  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["image"], name: "index_images_on_image", using: :btree
    t.index ["prototype_id"], name: "index_images_on_prototype_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "prototype_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["prototype_id"], name: "index_likes_on_prototype_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "prototypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                     default: "", null: false
    t.text     "concept",     limit: 65535
    t.string   "catch_copy",                default: "", null: false
    t.integer  "user_id"
    t.integer  "likes_count"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["user_id"], name: "index_prototypes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "name",                                 default: "", null: false
    t.text     "title",                  limit: 65535
    t.string   "job"
    t.text     "profile",                limit: 65535
    t.string   "avatar"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "prototypes"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "prototypes"
  add_foreign_key "likes", "prototypes"
  add_foreign_key "likes", "users"
  add_foreign_key "prototypes", "users"
end
