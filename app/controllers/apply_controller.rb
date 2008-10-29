class ApplyController < ApplicationController
  
  def apply
    @job_application = JobApplication.new 
    @job_application.user_id = session[:user_id]
    @job_application.job_posting_id = 4 #session[:job_posting].id
    redirect_to :action => "youve_applied" if @job_application.save
    
    @job_application_status = JobApplicationStatus.new
    @job_application_status.job_application_id = @job_application.id
    @job_application_status.job_application_state_id = #whichever id is apply
    @job_application_status.active == true
    @job_application_status.user_id = @job_application.user_id 
    
    #needs to send an email to employer
  end
  
  def youve_applied
    @job_application = JobApplication.find_by_user_id session[:user_id]
  end
  
  def invite
    @job_application = JobApplication.new 
    @job_application.user_id = 4 #session[:professional_id] #needs to be getting put into session in professional view
    @job_application.job_posting_id = 1 #session[:job_posting_id] #needs to be put in session in search results
    redirect_to :action => "youve_invited" if @job_application.save
    
    @job_application_status = JobApplicationStatus.new
    @job_application_status.job_application_id = @job_application.id
    @job_application_status.job_application_state_id = #whichever id is invite
    @job_application_status.active == true
    @job_application_status.user_id = @job_application.user_id
    
    #needs to send an email to professional
  end
  
  def youve_invited
    @job_application = JobApplication.find_by_user_id 4 #session[:professional]
    debugger
  end
  
  def why_closing
  end
  
  def close_application 
    @job_application = session[:job_application] #need to figure out where to get this from for emp and profs 
    @job_application_status = JobApplicationStatus.find_by_job_application_id @job_application.id
    @job_application_status.active == false
    @job_application_status.note = params[:note]
  end  
  
  def view_employer_activity
    @jobs = JobPosting.find :all #find by employer_id
    @job_applications = JobApplication.find :all #_by_job_posting_id job
    debugger
  end
  
  def activity_by_job
     @job_applications = JobApplication.find :all
  end
end
