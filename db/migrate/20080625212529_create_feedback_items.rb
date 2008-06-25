class CreateFeedbackItems < ActiveRecord::Migration
  def self.up
    create_table :feedback_items do |t|
      t.integer :job_application_id
      t.integer :user_id
      t.boolean :on_time
      t.boolean :serious
      t.boolean :honest
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :feedback_items
  end
end
