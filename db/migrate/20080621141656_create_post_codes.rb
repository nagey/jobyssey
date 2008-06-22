class CreatePostCodes < ActiveRecord::Migration
  def self.up
    create_table :post_codes do |t|
      t.string :name
      t.integer :town_id
      t.integer :geo_position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :post_codes
  end
end
