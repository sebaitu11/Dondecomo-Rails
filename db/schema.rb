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

ActiveRecord::Schema.define(version: 20140912150130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "barrios", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "details"
  end

  create_table "cartas", force: true do |t|
    t.string   "name"
    t.integer  "resto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", force: true do |t|
    t.string   "name"
    t.integer  "carta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", force: true do |t|
    t.string   "name"
    t.integer  "resto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telefono"
    t.string   "email"
    t.string   "capacidad"
    t.string   "direccion"
    t.string   "horario"
    t.string   "sitio"
  end

  create_table "menus", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resto_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "imaegeble_id"
    t.string   "imaegeble_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "platos", force: true do |t|
    t.string   "name"
    t.integer  "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "price"
  end

  create_table "promos", force: true do |t|
    t.string   "name"
    t.integer  "resto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "price"
    t.integer  "discount"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "restos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "details"
    t.string   "image"
    t.integer  "barrio_id"
    t.integer  "admin_id"
    t.boolean  "is_premium"
    t.boolean  "hasFumadores"
    t.boolean  "hasReservas"
    t.boolean  "hasParking"
    t.boolean  "hasMenu"
    t.boolean  "hasTickets"
    t.boolean  "hasWifi"
    t.string   "tipo"
  end

end
