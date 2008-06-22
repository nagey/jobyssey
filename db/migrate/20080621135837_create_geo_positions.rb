class CreateGeoPositions < ActiveRecord::Migration
  def self.up
    create_table :geo_positions do |t|
      t.decimal :longitude, { :precision => 6}
      t.decimal :latitude, { :precision => 6}

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_positions
  end
end
