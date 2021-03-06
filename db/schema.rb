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

ActiveRecord::Schema.define(:version => 20130509103857) do

  create_table "accounts", :force => true do |t|
    t.string   "twitter_id"
    t.string   "twitter_token"
    t.string   "twitter_secret"
    t.datetime "last_login"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "twitter_image_url"
    t.string   "twitter_screen_name"
  end

  create_table "ng_words", :force => true do |t|
    t.integer  "account_id"
    t.string   "word"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ng_words", ["account_id"], :name => "index_ng_words_on_account_id"

end
