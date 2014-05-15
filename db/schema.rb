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

ActiveRecord::Schema.define(version: 20140515221453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  add_index "editions", ["organization_id"], name: "index_editions_on_organization_id", using: :btree
  add_index "editions", ["publication_id"], name: "index_editions_on_publication_id", using: :btree
  add_index "editions", ["user_id"], name: "index_editions_on_user_id", using: :btree

  create_table "publications", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["organization_id"], name: "index_publications_on_organization_id", using: :btree
  add_index "publications", ["user_id"], name: "index_publications_on_user_id", using: :btree

end
