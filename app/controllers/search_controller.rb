class SearchController < ApplicationController
  
  def all_professionals
    @professionals = Professional.find :all
    @skills = Skill.find :all
    session[:job_posting] = JobPosting.find_by_id params[:id] unless params[:id].nil?
  end
    
  def all_jobs
    @employers = Employer.find :all
    @jobs = JobPosting.find :all
    @skills = Skill.find :all
    end
end


