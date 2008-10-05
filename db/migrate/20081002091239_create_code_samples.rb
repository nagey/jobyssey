class CreateCodeSamples < ActiveRecord::Migration
  def self.up
    create_table :code_samples do |t|
      t.integer :user_id 
      t.integer :code_sample_question_id 
      t.float :time_to_answer 
      t.text :code_sample
      
      t.timestamps
    end
  end

  def self.down
    drop_table :code_samples
  end
end
