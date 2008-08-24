class CreateJobPostingsWorkflows < ActiveRecord::Migration
  def self.up
    create_table :job_postings_workflows, :id => false do |t|
      t.integer :job_posting_id
      t.integer :workflow_id
      t.timestamps
    end
  end

  def self.down
  end
end
