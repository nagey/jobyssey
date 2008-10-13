class CreateCodeSampleQuestions < ActiveRecord::Migration
  def self.up
    create_table :code_sample_questions do |t|
      t.string :code_sample_question 
      t.integer :code_sample_level
      
      t.timestamps
    end
      a = [
      { 'code_sample_question' => "Write a program that plays Tic-Tac-Toe.", 'code_sample_level' => 1},{ 'code_sample_question' => "Write a program that converts values from one unit to another (inches to centimeters, for example).  Your program should be able to convert amongst the common units (and uncommon ones too, if you like), in your chosen type of measurement (weight, distance, volume, etc.)  It should print a notice clarifying which types of imput are acceptable before asking for an initial measurement and unit and a desired final unit.", 'code_sample_level' => 1}, { 'code_sample_question' => "Write a program that gives a multiplication tables quiz.  It should ask 10 questions (using any positive integer 12 and below), then calculate a percentage score and return it and a message to the user.", 'code_sample_level' => 1}, { 'code_sample_question' => "Write a developer-speak sentence generator.  Create an array of suitable nouns, adjectives, and verbs (a few of each will suffice), and some basic sentences.  Once a word has been used it should not be used again.", 'code_sample_level' => 1}, { 'code_sample_question' => "Write a program that uses a very simple encryption scheme to encrypt a string imput.  Again, doesn't have to be breaking brilliant new ground in cryptography- simple substitution will work, or something fancier if you're so inclined.", 'code_sample_level' => 1}, { 'code_sample_question' => "Write a Rock-Paper-Scissors game.  A user plays against the computer (which can pick it's moves randomly, or using a strategy of your devising).  Best of 3 rounds wins.", 'code_sample_level' => 1}, { 'code_sample_question' => "Write a program that converts from normal numbers to Roman Numerals and back again for numbers equal to or less than 1,000.", 'code_sample_level' => 1}]
      
      
        a.each do |thehash|
            question = CodeSampleQuestion.new thehash
            question.save
        end
  end

  def self.down
    drop_table :code_sample_questions
  end
end
