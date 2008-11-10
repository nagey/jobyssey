class LengthenerSessionText < ActiveRecord::Migration
  def self.up
     execute "ALTER TABLE sessions MODIFY COLUMN data LONGTEXT"
  end

  def self.down
  end
end
