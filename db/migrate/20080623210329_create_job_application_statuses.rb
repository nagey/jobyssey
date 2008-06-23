class CreateJobApplicationStatuses < ActiveRecord::Migration
  def self.up
    create_table :job_application_statuses do |t|
      t.integer :job_application_id
      t.integer :job_application_state_id
      t.text :note
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :job_application_statuses
  end
end
