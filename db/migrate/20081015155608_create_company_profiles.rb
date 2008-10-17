class CreateCompanyProfiles < ActiveRecord::Migration
  def self.up
    create_table :company_profiles do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :company_profiles
  end
end
