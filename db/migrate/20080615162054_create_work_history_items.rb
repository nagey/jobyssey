class CreateWorkHistoryItems < ActiveRecord::Migration
  def self.up
    create_table :work_history_items do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :work_history_items
  end
end
