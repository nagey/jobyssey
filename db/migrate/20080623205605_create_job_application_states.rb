class CreateJobApplicationStates < ActiveRecord::Migration
  def self.up
    create_table :job_application_states do |t|
      t.string :name
      t.integer :order
      t.integer :workflow_id
      t.integer :job_application_status_type_id

      t.timestamps
      
    end
    
      a = [ { 'name' => "Open Invitation", 'workflow_id' =>1 },
        { 'name' => "Open Application", 'workflow_id' => 2, }, { 'name' => "Closed Application- by employer", 'workflow_id' => 3 }, { 'name' => "Closed Application- by professional", 'workflow_id' => 4 }
        ]
          a.each do |thehash|
               metric = JobApplicationState.new thehash
               metric.save
          end

  end

  def self.down
    drop_table :job_application_states
  end
end
