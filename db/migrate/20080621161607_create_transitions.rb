class CreateTransitions < ActiveRecord::Migration
  def self.up
    create_table :transitions do |t|
      t.string :name
      t.integer :current_state_id
      t.integer :next_state_id
      t.integer :workflow_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transitions
  end
end
