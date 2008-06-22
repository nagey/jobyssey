class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.string :name
      t.string :lower_bound
      t.string :upper_bound
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :metrics
  end
end
