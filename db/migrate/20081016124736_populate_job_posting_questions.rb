class PopulateJobPostingQuestions < ActiveRecord::Migration
  def self.up
    
    
    
      a = ["What is the most unique thing about this company (compared to others of similar size and industry)?", "What is the best part of working here?", "Do you have any unusual perks or benefits?", "How do you see your business changing in the next 5 years?", "How would you describe your company culture?", "Can you describe a typical employee here?"]

      a.each do |name|
          temp = JobPostingQuestion.new
          temp.name = name
          temp.save
      end
    
    
  end

  def self.down
  end
end
