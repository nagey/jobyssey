class CreateEducationalLevels < ActiveRecord::Migration
  def self.up
    create_table :educational_levels do |t|
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :educational_levels
  end
end
