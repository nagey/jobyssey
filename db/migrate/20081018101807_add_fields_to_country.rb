class AddFieldsToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :phone_number_format, :string
    add_column :countries, :use_administrative_division, :boolean
    add_column :countries, :use_post_code, :boolean
  end

  def self.down
  end
end
