class CreateEducationConcentrations < ActiveRecord::Migration
  def self.up
    create_table :education_concentrations do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :education_concentrations
  end
end
