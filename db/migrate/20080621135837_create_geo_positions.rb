class CreateGeoPositions < ActiveRecord::Migration
  def self.up
    create_table :geo_positions do |t|
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_positions
  end
end
