class CreateCountriesCurrencies < ActiveRecord::Migration
  def self.up
    create_table :countries_currencies, :id => false do |t|
      t.integer :country_id
      t.integer :currency_id
      t.timestamps
    end
  end

  def self.down
  end
end
