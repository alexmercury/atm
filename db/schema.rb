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

ActiveRecord::Schema.define(version: 2018_10_24_113701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banknotes", force: :cascade do |t|
    t.integer "nominal_value"
    t.integer "amount", default: 0
    t.index ["nominal_value"], name: "index_banknotes_on_nominal_value", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.jsonb "banknotes", default: {}
    t.integer "total_amount"
    t.boolean "success", default: false
  end

end
