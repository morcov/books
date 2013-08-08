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

ActiveRecord::Schema.define(version: 20130802150227) do

  create_table "books", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["book_id"], name: "index_comments_on_book_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "paths", force: true do |t|
    t.string   "path"
    t.text     "text"
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paths", ["book_id"], name: "index_paths_on_book_id", using: :btree
  add_index "paths", ["user_id"], name: "index_paths_on_user_id", using: :btree

  create_table "ranks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "rank_id",         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
