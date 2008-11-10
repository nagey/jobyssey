class LengthenSessionText < ActiveRecord::Migration
  def self.up
     execute "ALTER TABLE sessions MODIFY COLUMN text LONGTEXT"
  end

  def self.down
  end
end
