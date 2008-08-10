class AddPrefsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :working_time_id, :integer
    add_column :users, :employment_type_id, :integer
  end

  def self.down
  end
end
