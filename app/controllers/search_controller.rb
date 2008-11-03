class SearchController < ApplicationController
  
  def all_professionals
    @professionals = Professional.find :all
    @skills = Skill.find :all
  end
    
end


