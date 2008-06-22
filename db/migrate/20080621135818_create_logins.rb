class CreateLogins < ActiveRecord::Migration
  def self.up
    create_table :logins do |t|
      t.integer :user_id
      t.integer :geo_position_id
      t.string :ip_address

      t.timestamps
    end
  end

  def self.down
    drop_table :logins
  end
end
