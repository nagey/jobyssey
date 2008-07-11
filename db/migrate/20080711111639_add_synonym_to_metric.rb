class AddSynonymToMetric < ActiveRecord::Migration
  def self.up
    add_column :metrics, :synonym_id, :integer
  end

  def self.down
  end
end
