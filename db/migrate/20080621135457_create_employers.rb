class CreateEmployers < ActiveRecord::Migration
  def self.up
    create_table :employers do |t|
      t.string :name
      t.string :tagline
      t.string :size
      t.text :description
      t.integer :industry_id
      t.string :search_position
      t.string :geo_position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employers
  end
end
