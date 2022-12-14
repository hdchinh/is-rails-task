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

ActiveRecord::Schema.define(version: 2022_08_07_035223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "total_requests_last_hour", default: 0
    t.integer "total_requests_last_month", default: 0
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "queue_jobs", force: :cascade do |t|
    t.string "status", default: "0"
    t.integer "job_type", default: 0
    t.integer "priority", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.datetime "execute_at"
    t.jsonb "job_params", default: {}
    t.string "worker_id"
    t.boolean "executed", default: false
    t.index ["client_id"], name: "index_queue_jobs_on_client_id"
  end

  create_table "user_metrics", force: :cascade do |t|
    t.string "month"
    t.integer "total_requests", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_user_metrics_on_client_id"
  end

  add_foreign_key "queue_jobs", "clients"
  add_foreign_key "user_metrics", "clients"
end
