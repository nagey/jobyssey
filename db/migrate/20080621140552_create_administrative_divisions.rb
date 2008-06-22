class CreateAdministrativeDivisions < ActiveRecord::Migration
  def self.up
    create_table :administrative_divisions do |t|
      t.string :name
      t.integer :country_id
      t.integer :geo_position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :administrative_divisions
  end
end
