class CreateBenefitsJobPostings < ActiveRecord::Migration
  def self.up
    create_table :benefits_job_postings, :id => false do |t|
      t.integer :benefit_id
      t.integer :job_posting_id
      t.timestamps
    end
  end

  def self.down
  end
end
