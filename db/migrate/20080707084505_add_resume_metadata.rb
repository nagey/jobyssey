class AddResumeMetadata < ActiveRecord::Migration
  def self.up
    add_column :users, :cv_name, :string
    add_column :users, :cv_content_type, :string
  end

  def self.down
  end
end
