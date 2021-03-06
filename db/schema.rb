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

ActiveRecord::Schema.define(version: 20170610132147) do

  create_table "articles", force: :cascade do |t|
    t.string   "headline"
    t.text     "textonly"
    t.date     "date_published"
    t.text     "textorig"
    t.integer  "portal_source_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img"
    t.string   "origurl"
    t.index ["portal_source_id"], name: "index_articles_on_portal_source_id"
  end

  create_table "portal_sources", force: :cascade do |t|
    t.string   "name"
    t.integer  "size",       default: 50
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
