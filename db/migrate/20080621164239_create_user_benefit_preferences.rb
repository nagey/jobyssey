class CreateUserBenefitPreferences < ActiveRecord::Migration
  def self.up
    create_table :user_benefit_preferences do |t|
      t.integer :user_id
      t.integer :benefit_id
      t.integer :benefit_preference

      t.timestamps
    end
  end

  def self.down
    drop_table :user_benefit_preferences
  end
end
