class CreateJobPostingRequirements < ActiveRecord::Migration
  def self.up
    create_table :job_posting_requirements do |t|
      t.integer :job_posting_id
      t.integer :metric_id
      t.integer :value
      
       t.timestamps
      end
  end

  def self.down
  end
end
