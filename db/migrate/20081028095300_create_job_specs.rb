class CreateJobSpecs < ActiveRecord::Migration
  def self.up
    create_table :job_specs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :job_specs
  end
end
