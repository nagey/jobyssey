class CreateEducationQualificationsJobPostings < ActiveRecord::Migration
  def self.up
    create_table :educational_qualifications_job_postings, :id => false do |t|
      t.integer :job_posting_id
      t.integer :educational_qualification_id
      t.timestamps
    end    
  end

  def self.down
  end
end
