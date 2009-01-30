class AddPremiumToEmployers < ActiveRecord::Migration
  def self.up
        add_column :employers, :premium, :boolean, :default => false
  end

  def self.down
  end
end
