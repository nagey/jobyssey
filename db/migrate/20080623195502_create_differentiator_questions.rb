class CreateDifferentiatorQuestions < ActiveRecord::Migration
  def self.up
    create_table :differentiator_questions do |t|
      t.string :type
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :differentiator_questions
  end
end
