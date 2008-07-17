class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address1, :address2, :town_id 
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
