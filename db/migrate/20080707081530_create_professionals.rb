class CreateProfessionals < ActiveRecord::Migration
  def self.up
    create_table :professionals do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :professionals
  end
end
