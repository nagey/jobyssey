class CreateJobPostings < ActiveRecord::Migration
  def self.up
    create_table :job_postings do |t|
      t.string :title
      t.integer :employer_id
      t.text :description
      t.string :search_position
      t.decimal :maximum_salary
      t.decimal :minimum_salary
      t.boolean :education_required
      t.integer :employment_type_id
      t.integer :working_time_id

      t.timestamps
    end
  end

  def self.down
    drop_table :job_postings
  end
end
