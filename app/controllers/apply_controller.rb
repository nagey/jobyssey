class ApplyController < ApplicationController
  
  def apply
    @job_application = JobApplication.new 
    @job_application.user_id = session[:user_id]
    @job_application.job_posting_id = session[:job_posting_id]
    @job_application.save
    
    @job_application_status = JobApplicationStatus.new
    @job_application_status.job_application_id = @job_application.id
    @job_application_status.job_application_state_id = #whichever id is apply
    @job_application_status.active == true
    @job_application_status.user_id = @job_application.user_id 
    
    #needs to send an email to employer
  end
  
  def invite
    @job_application = JobApplication.new 
    @job_application.user_id = session[:professional_id] #needs to be getting put into session in professional view
    @job_application.job_posting_id = session[:job_posting_id] #needs to be put in session in search results
    @job_application.save
    
    @job_application_status = JobApplicationStatus.new
    @job_application_status.job_application_id = @job_application.id
    @job_application_status.job_application_state_id = #whichever id is invite
    @job_application_status.active == true
    @job_application_status.user_id = @job_application.user_id
    
    #needs to send an email to professional
  end
  
  def why_closing
  end
  
  def close_application 
    @job_application = session[:job_application] #need to figure out where to get this from for emp and profs 
    @job_application_status = JobApplicationStatus.find_by_job_application_id @job_application.id
    @job_application_status.active == false
    @job_application_status.note = params[:note]
  end  
  
end
