class CreateAddressesEmployers < ActiveRecord::Migration
  def self.up
    create_table :addresses_employers, :id => false do |t|
      t.integer :address_id
      t.integer :employer_id
      t.timestamps
    end
  end

  def self.down
  end
end
