class AddResumeBlob < ActiveRecord::Migration
  def self.up
    add_column :users, :cv, :binary, :limit => 5.megabyte
  end

  def self.down
  end
end
