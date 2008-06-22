class CreateJobApplicationStatusTypes < ActiveRecord::Migration
  def self.up
    create_table :job_application_status_types do |t|
      t.string :name
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :job_application_status_types
  end
end
