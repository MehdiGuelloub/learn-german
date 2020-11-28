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

ActiveRecord::Schema.define(version: 2020_11_27_091241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.bigint "term_id", null: false
    t.boolean "correct", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["term_id"], name: "index_attempts_on_term_id"
  end

  create_table "examples", force: :cascade do |t|
    t.bigint "term_id", null: false
    t.string "sentence", null: false
    t.string "keyword", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["term_id"], name: "index_examples_on_term_id"
  end

  create_table "practices", force: :cascade do |t|
    t.integer "number_of_practiced_words_per_day", default: 0, null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_mistakes_per_day", default: 0, null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string "type", null: false
    t.string "base", null: false
    t.string "meaning", null: false
    t.string "perfect"
    t.string "praeteritum"
    t.integer "article"
    t.string "plural"
    t.string "comparative"
    t.string "superlative"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "meaning_learned", default: false, null: false
    t.string "meanings_accepted"
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
    t.integer "article_attempts", default: 0, null: false
    t.integer "article_mistakes", default: 0, null: false
    t.integer "article_consecutive_correct_answers", default: 0, null: false
    t.boolean "migrated", default: false
  end

end
