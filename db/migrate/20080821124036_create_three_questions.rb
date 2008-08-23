class CreateThreeQuestions < ActiveRecord::Migration
  def self.up
     create_table :three_questions do |t|
        t.string  :id
        t.integer :user_id
        t.integer :question_id
        t.text    :answer
        t.timestamps 
  end

  def self.down
  end
end
