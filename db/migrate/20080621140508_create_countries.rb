class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :administrative_division_name
      t.string :post_code_name
      t.string :post_code_format
      t.string :phone_number_format
      t.integer :dialing_code
      t.integer :geo_position_id
      t.boolean :use_administrative_division
      t.boolean :use_post_code

      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
