class SearchController < ApplicationController
  
  def all_professionals
    @professionals = Professional.find :all
  end
    
end


