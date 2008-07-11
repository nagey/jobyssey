class AddSearchNameToSkillMetric < ActiveRecord::Migration
  def self.up
    add_column :metrics, :display_name, :string
  end

  def self.down
  end
end
