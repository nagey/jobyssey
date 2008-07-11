class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :entity_id
      t.string :entity_type
      t.string :name
      t.string :url
      t.text :description
      t.binary :attachment
      t.string :file_name
      t.string :content_type
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
