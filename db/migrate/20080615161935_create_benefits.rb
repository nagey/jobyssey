class CreateBenefits < ActiveRecord::Migration
  def self.up
    create_table :benefits do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :benefits
  end
end
