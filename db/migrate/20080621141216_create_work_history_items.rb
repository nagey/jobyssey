class CreateWorkHistoryItems < ActiveRecord::Migration
  def self.up
    create_table :work_history_items do |t|
      t.string :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :salary
      t.text :description
      t.integer :job_title_id
      t.integer :geo_position_id
      t.integer :administrative_division_id
      t.integer :town_id
      t.integer :country_id
      t.integer :employer_id
      t.integer :employment_type_id
      t.integer :working_time_id

      t.timestamps
    end
  end

  def self.down
    drop_table :work_history_items
  end
end
