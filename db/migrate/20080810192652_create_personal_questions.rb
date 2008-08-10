class CreatePersonalQuestions < ActiveRecord::Migration
  def self.up
    create_table :personal_questions do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :personal_questions
  end
end
