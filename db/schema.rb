# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_02_17_111516) do
  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "state"
    t.string "latitude"
    t.string "longitude"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "rank"
    t.string "photo"
    t.string "zip"
    t.string "city"
    t.string "program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id", null: false
    t.index ["state_id"], name: "index_universities_on_state_id"
  end

  create_table "university_programs", force: :cascade do |t|
    t.integer "university_id", null: false
    t.integer "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_university_programs_on_program_id"
    t.index ["university_id"], name: "index_university_programs_on_university_id"
  end

  add_foreign_key "universities", "states"
  add_foreign_key "university_programs", "programs"
  add_foreign_key "university_programs", "universities"
end
