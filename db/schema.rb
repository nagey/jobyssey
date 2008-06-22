# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080621164239) do

  create_table "accounts", :force => true do |t|
    t.integer  "employer_id"
    t.integer  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "town_id"
    t.integer  "geo_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses_employers", :force => true do |t|
    t.integer  "address_id"
    t.integer  "employer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses_users", :force => true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrative_divisions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.integer  "geo_position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "benefits", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "benefits_job_postings", :force => true do |t|
    t.integer  "benefit_id"
    t.integer  "job_posting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "administrative_division_name"
    t.string   "post_code_name"
    t.string   "post_code_format"
    t.string   "phone_number_format"
    t.integer  "dialing_code"
    t.integer  "geo_position_id"
    t.boolean  "use_administrative_division"
    t.boolean  "use_post_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries_currencies", :force => true do |t|
    t.integer  "country_id"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.string   "currency_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.string   "size"
    t.text     "description"
    t.integer  "industry_id"
    t.string   "search_position"
    t.string   "geo_position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers_workflows", :force => true do |t|
    t.integer  "employer_id"
    t.integer  "workflow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geo_positions", :force => true do |t|
    t.integer  "longitude",  :limit => 6, :precision => 6, :scale => 0
    t.integer  "latitude",   :limit => 6, :precision => 6, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.string   "search_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_application_attachments", :force => true do |t|
    t.integer  "job_application_id"
    t.string   "type"
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_application_states", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "workflow_id"
    t.string   "job_application_status_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_application_status_types", :force => true do |t|
    t.string   "name"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_application_statuses", :force => true do |t|
    t.integer  "job_application_id"
    t.integer  "job_application_state_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_posting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_postings_roles", :force => true do |t|
    t.integer  "job_posting_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_postings_workflows", :force => true do |t|
    t.integer  "job_posting_id"
    t.integer  "workflow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "geo_position_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", :force => true do |t|
    t.string   "name"
    t.string   "lower_bound"
    t.string   "upper_bound"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_qualities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "metric_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_number_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "number"
    t.integer  "phone_number_type_id"
    t.integer  "country_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_codes", :force => true do |t|
    t.string   "name"
    t.integer  "town_id"
    t.integer  "geo_position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "employer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_transitions", :force => true do |t|
    t.integer  "role_id"
    t.integer  "transition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "towns", :force => true do |t|
    t.string   "name"
    t.integer  "administrative_division_id"
    t.integer  "country_id"
    t.integer  "geo_position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "account_id"
    t.string   "transaction_type"
    t.integer  "amount"
    t.string   "reference"
    t.integer  "job_application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transitions", :force => true do |t|
    t.string   "name"
    t.integer  "current_state_id"
    t.integer  "next_state_id"
    t.integer  "workflow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_benefit_preferences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "benefit_id"
    t.integer  "benefit_preference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_names"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "code_name"
    t.string   "type"
    t.integer  "employer_id"
    t.string   "search_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_history_items", :force => true do |t|
    t.string   "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "salary"
    t.text     "description"
    t.integer  "job_title_id"
    t.integer  "geo_location_id"
    t.integer  "administrative_division_id"
    t.integer  "city_id"
    t.integer  "country_id"
    t.integer  "employer_id"
    t.integer  "employment_type_id"
    t.integer  "working_time_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_times", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
