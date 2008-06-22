class CreateTowns < ActiveRecord::Migration
  def self.up
    create_table :towns do |t|
      t.string :name
      t.integer :administrative_division_id
      t.integer :country_id
      t.integer :geo_position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :towns
  end
end
