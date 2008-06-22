class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :town_id
      t.integer :geo_position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
