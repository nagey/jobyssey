class CreatePostCodes < ActiveRecord::Migration
  def self.up
    create_table :post_codes do |t|
      t.string :post_code
      t.integer :longitude, :latitude, :town_id
      t.timestamps
    end
  end

  def self.down
    drop_table :post_codes
  end
end
