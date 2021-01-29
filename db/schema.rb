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

ActiveRecord::Schema.define(version: 2021_01_29_094625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "practices", force: :cascade do |t|
    t.integer "number_of_practiced_words_per_day", default: 0, null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_mistakes_per_day", default: 0, null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word", null: false
    t.string "meaning", null: false
    t.string "notes"
    t.integer "attempts", default: 0, null: false
    t.integer "mistakes", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "article", default: 0, null: false
    t.integer "consecutive_correct_answers", default: 0, null: false
    t.string "example"
    t.string "keyword"
    t.boolean "learned", default: false
    t.integer "word_type", default: 0, null: false
    t.string "perfect"
    t.string "praeteritum"
    t.string "plural"
    t.string "comparative"
    t.string "superlative"
    t.string "meaning_forms"
    t.integer "verb_preposition"
    t.integer "learned_status"
  end

end
