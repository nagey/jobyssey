class CreateEmployersWorkflows < ActiveRecord::Migration
  def self.up
    create_table :employers_workflows do |t|
      t.integer :employer_id
      t.integer :workflow_id
      t.timestamps
    end
  end

  def self.down
  end
end
