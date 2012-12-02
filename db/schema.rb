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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121201225730) do

  create_table "comments", :force => true do |t|
    t.string   "commentor_name"
    t.datetime "date"
    t.string   "details"
    t.integer  "issue_id"
    t.boolean  "from_developer"
  end

  create_table "daterecords", :force => true do |t|
    t.string   "name"
    t.datetime "dt"
  end

  create_table "issues", :force => true do |t|
    t.string   "name"
    t.datetime "date_entered"
    t.integer  "votes"
    t.string   "link_to_uservoice"
    t.string   "action"
    t.string   "as_a"
    t.string   "so_that"
    t.string   "i_want"
    t.integer  "project_id"
    t.integer  "pivotal_issue_id"
    t.string   "progress"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "projects", :force => true do |t|
    t.string  "name"
    t.integer "pivotal_tracker_id"
  end

  create_table "uservoice_tickets", :force => true do |t|
    t.string "body"
    t.string "subject"
    t.string "uservoice_id"
    t.string "uservoice_auther_karma"
    t.string "ticket_number"
    t.string "url"
  end

end
