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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120524065521) do

  create_table "clients", :force => true do |t|
    t.string   "proj_name"
    t.string   "category"
    t.string   "frontend"
    t.string   "backend"
    t.text     "details"
    t.integer  "cost"
    t.string   "duration"
    t.date     "todays_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "emp_ID"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "designation"
    t.string   "qualification"
    t.text     "skils"
    t.string   "status"
    t.integer  "phone",         :limit => 8
    t.string   "gender"
    t.text     "address"
    t.integer  "salary",        :limit => 8
    t.string   "project_id",    :limit => 11
    t.string   "team_id",       :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "enquiries", :force => true do |t|
    t.integer  "user_id"
    t.string   "proj_name"
    t.string   "category"
    t.string   "frontend"
    t.string   "backend"
    t.text     "details"
    t.integer  "cost"
    t.string   "duration"
    t.date     "todays_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "team_id"
    t.integer  "enquiry_id"
    t.string   "proj_name"
    t.string   "duration"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "team_ID"
    t.string   "team_lead_ID"
    t.integer  "no_of_emp"
    t.text     "emp_IDs"
    t.string   "status"
    t.string   "proj_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone",                 :limit => 8
    t.string   "location"
    t.string   "status"
    t.text     "version"
    t.string   "username"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
