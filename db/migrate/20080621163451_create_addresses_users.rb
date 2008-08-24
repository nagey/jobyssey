class CreateAddressesUsers < ActiveRecord::Migration
  def self.up
    create_table :addresses_users, :id => false do |t|
      t.integer :address_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
  end
end
