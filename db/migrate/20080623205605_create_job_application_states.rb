class CreateJobApplicationStates < ActiveRecord::Migration
  def self.up
    create_table :job_application_states do |t|
      t.string :name
      t.integer :order
      t.integer :workflow_id
      t.integer :job_application_status_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :job_application_states
  end
end
