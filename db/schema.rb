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

ActiveRecord::Schema.define(version: 20150604165547) do

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "blurb",                 default: "Eu putent convenire iudicabit est, illud everti bonorum usu ut. Nostro inermis eu mei, vel quodsi malorum salutatus id. Et tale possim eam, te illud facilisis disputando ius. Mel cu illud soleat, vix iusto mediocritatem id, ne vocent quaestio voluptaria mei. Primis prodesset delicatissimi at eum, lobortis torquatos mel an. Eu prima civibus neglegentur sed."
    t.boolean  "show_contact",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_img_file_name"
    t.string   "user_img_content_type"
    t.integer  "user_img_file_size"
    t.datetime "user_img_updated_at"
    t.boolean  "is_admin",              default: false
    t.boolean  "deleted",               default: false
  end

  create_table "users_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
