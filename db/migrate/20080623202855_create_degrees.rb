class CreateDegrees < ActiveRecord::Migration
  def self.up
    create_table :degrees do |t|
      t.integer :user_id
      t.integer :educational_institution_id
      t.integer :educational_qualification_id
      t.integer :education_concentration_id
      t.integer :educational_level_id

      t.timestamps
    end
  end

  def self.down
    drop_table :degrees
  end
end
