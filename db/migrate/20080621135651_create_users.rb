class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :middle_names
      t.string :last_name
      t.string :email
      t.string :password
      t.string :code_name
      t.string :type
      t.integer :employer_id
      t.string :search_position
      t.text :more_info

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
