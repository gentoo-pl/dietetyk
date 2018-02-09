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

ActiveRecord::Schema.define(version: 20171215214732) do

  create_table "dania", force: :cascade do |t|
    t.string "nazwa", null: false
    t.integer "suma_wartosci_energetycznej", default: 0
    t.integer "dodatkowa_wartosc_energetyczna", default: 0
    t.string "obrazek", default: ""
    t.boolean "aktywne", default: true
    t.text "opis"
    t.boolean "polecane", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kategoria_id"
  end

  create_table "dania_skladniki", id: false, force: :cascade do |t|
    t.integer "danie_id", null: false
    t.integer "skladnik_id", null: false
    t.index ["danie_id", "skladnik_id"], name: "index_dania_skladniki_on_danie_id_and_skladnik_id"
  end

  create_table "kategorie", force: :cascade do |t|
    t.string "nazwa", null: false
    t.boolean "aktywna", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skladniki", force: :cascade do |t|
    t.string "nazwa", null: false
    t.integer "wartosc_energetyczna", default: 0
    t.text "opis"
    t.string "obrazek", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
