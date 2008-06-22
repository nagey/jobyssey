class CreateAddressesEmployers < ActiveRecord::Migration
  def self.up
    create_table :addresses_employers do |t|
      t.integer :address_id
      t.integer :employer_id
      t.timestamps
    end
  end

  def self.down
  end
end
