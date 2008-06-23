class CreateDifferentiatorAnswers < ActiveRecord::Migration
  def self.up
    create_table :differentiator_answers do |t|
      t.integer :differentiator_question_id
      t.integer :employer_id
      t.integer :user_id
      t.integer :job_posting_id
      t.text :name

      t.timestamps
    end
  end

  def self.down
    drop_table :differentiator_answers
  end
end
