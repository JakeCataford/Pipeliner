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

ActiveRecord::Schema.define(version: 20130726143332) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "message"
    t.integer  "revision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meshes", force: true do |t|
    t.string   "name"
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revisions", force: true do |t|
    t.integer  "number"
    t.integer  "model_id"
    t.integer  "mesh_id"
    t.integer  "diffuse"
    t.integer  "normalmap"
    t.integer  "specular"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.boolean  "completed"
    t.integer  "revision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textures", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
