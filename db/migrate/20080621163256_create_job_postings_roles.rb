class CreateJobPostingsRoles < ActiveRecord::Migration
  def self.up
    create_table :job_postings_roles do |t|
      t.integer :job_posting_id
      t.integer :role_id
      t.timestamps
    end
  end

  def self.down
  end
end
