class LengthenAttachmentColumn < ActiveRecord::Migration

    def self.up
      execute "ALTER TABLE attachments MODIFY COLUMN attachment LONGBLOB"
    end

    def self.down
    end
  end
 