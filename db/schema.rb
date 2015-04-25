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

ActiveRecord::Schema.define(version: 20150425192709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "edition_copies", force: true do |t|
    t.integer  "user_id"
    t.integer  "edition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "edition_copies", ["edition_id"], name: "index_edition_copies_on_edition_id", using: :btree
  add_index "edition_copies", ["user_id"], name: "index_edition_copies_on_user_id", using: :btree

  create_table "editions", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "zip_name"
    t.string   "publish_date"
    t.string   "fmt_price"
    t.string   "volume_label"
    t.integer  "publication_id"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price",           default: 0.0, null: false
    t.float    "size"
    t.string   "size_units"
  end

  add_index "editions", ["organization_id"], name: "index_editions_on_organization_id", using: :btree
  add_index "editions", ["publication_id"], name: "index_editions_on_publication_id", using: :btree
  add_index "editions", ["user_id"], name: "index_editions_on_user_id", using: :btree

  create_table "editions_users", id: false, force: true do |t|
    t.integer "edition_id"
    t.integer "user_id"
  end

  add_index "editions_users", ["edition_id", "user_id"], name: "editions_users_index", unique: true, using: :btree

  create_table "news_organization_inquiries", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "organization"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsracks", force: true do |t|
    t.string   "sprite_path"
    t.string   "edition_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_users", force: true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_users", ["organization_id"], name: "index_organization_users_on_organization_id", using: :btree
  add_index "organization_users", ["user_id"], name: "index_organization_users_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "path"
    t.string   "type"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["organization_id"], name: "index_pages_on_organization_id", using: :btree
  add_index "pages", ["path"], name: "index_pages_on_path", using: :btree
  add_index "pages", ["publication_id"], name: "index_pages_on_publication_id", using: :btree
  add_index "pages", ["user_id"], name: "index_pages_on_user_id", using: :btree

  create_table "publications", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "subscription_price"
  end

  add_index "publications", ["organization_id"], name: "index_publications_on_organization_id", using: :btree
  add_index "publications", ["user_id"], name: "index_publications_on_user_id", using: :btree

  create_table "publications_users", id: false, force: true do |t|
    t.integer "publication_id"
    t.integer "user_id"
  end

  add_index "publications_users", ["publication_id", "user_id"], name: "publications_users_index", unique: true, using: :btree

  create_table "purchases", force: true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.float    "total"
    t.integer  "edition_copy_id"
    t.integer  "subscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["edition_copy_id"], name: "index_purchases_on_edition_copy_id", using: :btree
  add_index "purchases", ["subscription_id"], name: "index_purchases_on_subscription_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price",          default: 0.0, null: false
  end

  add_index "subscriptions", ["publication_id"], name: "index_subscriptions_on_publication_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.integer  "current_organization_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "wallet_transactions", force: true do |t|
    t.integer  "wallet_id"
    t.string   "type"
    t.float    "amount"
    t.float    "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "edition_copy_id"
    t.integer  "subscription_id"
  end

  add_index "wallet_transactions", ["edition_copy_id"], name: "index_wallet_transactions_on_edition_copy_id", using: :btree
  add_index "wallet_transactions", ["subscription_id"], name: "index_wallet_transactions_on_subscription_id", using: :btree
  add_index "wallet_transactions", ["wallet_id"], name: "index_wallet_transactions_on_wallet_id", using: :btree

  create_table "wallets", force: true do |t|
    t.integer  "user_id"
    t.float    "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

end
