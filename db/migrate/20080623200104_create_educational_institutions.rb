class CreateEducationalInstitutions < ActiveRecord::Migration
  def self.up
    create_table :educational_institutions do |t|
      t.string :name
      t.string :url
      t.integer :town_id
      t.integer :country_id
      t.integer :geo_position_id

      t.timestamps
    end
  end

  def self.down
    drop_table :educational_institutions
  end
end
