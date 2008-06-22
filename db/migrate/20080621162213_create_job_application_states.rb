class CreateJobApplicationStates < ActiveRecord::Migration
  def self.up
    create_table :job_application_states do |t|
      t.string :name
      t.integer :order
      t.integer :workflow_id
      t.string :job_application_status_type

      t.timestamps
    end
  end

  def self.down
    drop_table :job_application_states
  end
end
