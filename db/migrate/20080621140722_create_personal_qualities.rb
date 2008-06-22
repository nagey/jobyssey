class CreatePersonalQualities < ActiveRecord::Migration
  def self.up
    create_table :personal_qualities do |t|
      t.integer :user_id
      t.integer :metric_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :personal_qualities
  end
end
