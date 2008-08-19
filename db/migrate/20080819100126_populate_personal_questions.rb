class PopulatePersonalQuestions < ActiveRecord::Migration
  def self.up
    
  a = ["What is the best job or project you ever had and why?", "What kind of company do you see yourself working at?", "What are you the best at?", "Why did you get into this line of work?", "What do you want to be doing long-term for work?", "Why are you looking for a new job?", "What new skills would you like to develop that aren't part of your current job?", "How do you approach a new project?", "What is your professional Achilles' heel?", "What is your favorite book or movie and why?", "What industry would you prefer to work in?", "What kind of people do you work best with?", "What do you like to do in your free time (particularly anything work related)?"]
  a.each do |name|
      temp = PersonalQuestion.new
      temp.name = name
      temp.save
    end  
  end

  def self.down
  end
end
