class CreateProfessionalDetails < ActiveRecord::Migration
  def self.up
    create_table :professional_details do |t|
          t.integer :user_id
          
          t.decimal :current_salary
          t.decimal :desired_salary
          
          t.string :town
          t.string :county
          t.boolean :dart
          t.boolean :green_luas
          t.boolean :red_luas
          t.boolean :south_dublin
          t.boolean :north_dublin
          t.boolean :center_dublin
          t.text :location
    
          t.boolean :active
          t.boolean :passive
          t.boolean :inactive

          t.boolean :immediate
          t.boolean :one_month
          t.boolean :more_than_one_month
          t.boolean :specific_date
          t.text :availability

      t.timestamps
    end
  end

  def self.down
    drop_table :professional_details
  end
end
