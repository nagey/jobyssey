class CreateCodeSampleQuestions < ActiveRecord::Migration
  def self.up
    create_table :code_sample_questions do |t|
      t.string :code_sample_question 
      t.integer :code_sample_level
      
      t.timestamps
    end
      a = [
      { 'code_sample_question' => "Question 1, Level 1", 'code_sample_level' => 1},{ 'code_sample_question' => "Question 2, Level 1", 'code_sample_level' => 1}, { 'code_sample_question' => "Question 1, Level 2", 'code_sample_level' => 2}, { 'code_sample_question' => "Question 2, Level 2", 'code_sample_level' => 2}]
      
      
        a.each do |thehash|
            question = CodeSampleQuestion.new thehash
            question.save
        end
  end

  def self.down
    drop_table :code_sample_questions
  end
end
