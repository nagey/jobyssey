class CreateEducationalQualifications < ActiveRecord::Migration
  def self.up
    create_table :educational_qualifications do |t|
      t.string :name
      t.integer :educational_level_id

      t.timestamps
    end
  end

  def self.down
    drop_table :educational_qualifications
  end
end
