class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.integer :user_id
      t.integer :job_posting_id

      t.timestamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end
