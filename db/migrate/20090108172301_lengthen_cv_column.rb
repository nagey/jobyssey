class LengthenCvColumn < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE attachments MODIFY COLUMN attachtment LONGBLOB"
  end

  def self.down
  end
end
