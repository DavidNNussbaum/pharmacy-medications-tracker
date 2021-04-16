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

ActiveRecord::Schema.define(version: 2021_04_16_220401) do

  create_table "medications", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity_received", default: 0, null: false
    t.integer "pharmacy_id"
    t.index ["pharmacy_id"], name: "index_medications_on_pharmacy_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "dob", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pharmacies_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "medication_id", null: false
    t.integer "pharmacy_id", null: false
    t.boolean "dispensed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity_dispensed", default: 0, null: false
    t.index ["medication_id"], name: "index_prescriptions_on_medication_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
    t.index ["pharmacy_id"], name: "index_prescriptions_on_pharmacy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "provider"
  end

  add_foreign_key "prescriptions", "medications"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "prescriptions", "pharmacies"
end
