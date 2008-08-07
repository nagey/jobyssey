class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :id
      t.integer :user_id
      t.string :email
      t.string :name
      t.boolean :viewed
      t.boolean :email_sent
      t.integer :signed_up_as_user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :invites
  end
end
