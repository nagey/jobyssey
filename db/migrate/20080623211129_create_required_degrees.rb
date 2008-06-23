class CreateRequiredDegrees < ActiveRecord::Migration
  def self.up
    create_table :required_degrees do |t|
      t.integer :job_posting_id
      t.integer :educational_level_id
      t.integer :education_concentration_id

      t.timestamps
    end
  end

  def self.down
    drop_table :required_degrees
  end
end
