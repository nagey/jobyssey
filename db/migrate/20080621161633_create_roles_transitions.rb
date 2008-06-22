class CreateRolesTransitions < ActiveRecord::Migration
  def self.up
    create_table :roles_transitions do |t|
      t.integer :role_id
      t.integer :transition_id
      t.timestamps
    end
  end

  def self.down
  end
end
