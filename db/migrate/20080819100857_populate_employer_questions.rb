class PopulateEmployerQuestions < ActiveRecord::Migration
  def self.up
    
    a = ["What 1 task will take up most of my time?", "How is the role different from any other positions with the same job title?", "What is the key to being successful in this role?", "What is the most challenging part of this job?", "What one thing should I watch out for as a new person in this job?", "What is the most exciting part of this job?", "What level of training would I get as a new employee in this role?", "How closely will I be working with others in this role, and who will I be working with the most?", "Who do I report to?", "What are the perks of this job?", "Do you see this role changing in the next two years, and if so, how?", "Who are my clients in this position?  How much contact do I have with them?", "What is the coolest thing about this company, and about this department?", "What are the hours?  Does anything (either work or fun) go on outside usual hours?"]
  
    a.each do |name|
        temp = EmployerQuestion.new
        temp.name = name
        temp.save
    end
  end

  def self.down
  end
end
