class AddIntendedJobTitleToProfessionals < ActiveRecord::Migration
  def self.up
    add_column :users, :desired_job_title, :string
  end

  def self.down
  end
end


