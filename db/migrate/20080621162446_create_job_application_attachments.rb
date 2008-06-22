class CreateJobApplicationAttachments < ActiveRecord::Migration
  def self.up
    create_table :job_application_attachments do |t|
      t.integer :job_application_id
      t.string :type
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :job_application_attachments
  end
end
