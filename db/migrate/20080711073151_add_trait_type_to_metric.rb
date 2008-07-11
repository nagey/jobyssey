class AddTraitTypeToMetric < ActiveRecord::Migration
  def self.up
    add_column :metrics, :trait_type, :string, :default => 'Job Posting'
  end

  def self.down
  end
end
