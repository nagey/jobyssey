class ApplyController < ApplicationController
  
  def apply
    @job_application = JobApplication.new 
    @job_application.user_id = session[:user_id]
    @job_application.job_posting_id = 4 #session[:job_posting].id
    @job_posting = @job_application.job_posting
    redirect_to :action => "youve_applied" if @job_application.save
    
    @job_application_status = JobApplicationStatus.new
    @job_application_status.job_application_id = @job_application.id
    @job_application_status.job_application_state_id = #whichever id is apply
    @job_application_status.active == true
    @job_application_status.user_id = @job_application.user_id 
    
    #needs to send an email to employer
    @employer_id = @job_posting.employer_id
    @employer_employee = User.find_by_employer_id @employer_id
    @employer_email = @employer_employee.email
    @job_title = @job_posting.title
    @cv = @job_application.user.cv.attachment
    @professional = @job_application.user
    Emailer.deliver_new_application(@employer_email, @job_title, @professional) #@cv
  end
  
  def youve_applied
    @job_application = JobApplication.find_by_user_id session[:user_id]
  end
  
  def invite
    @job_application = JobApplication.new 
    @job_application.user_id = 5 #session[:professional_id] #needs to be getting put into session in professional view
    @job_application.job_posting_id = 5 #session[:job_posting_id] #needs to be put in session in search results
    redirect_to :action => "youve_invited" if @job_application.save
    
    @job_application_status = JobApplicationStatus.new
    @job_application_status.job_application_id = @job_application.id
    @job_application_status.job_application_state_id = #whichever id is invite
    @job_application_status.active == true
    @job_application_status.user_id = @job_application.user_id
    
    #needs to send an email to professional
    @professional = @job_application.user.email
    @job_title = @job_application.job_posting.title
    @employer = @job_application.job_posting.employer.name
    
    Emailer.deliver_new_invitation(@professional, @job_title, @employer)
  end
  
  def youve_invited
    @job_application = JobApplication.find_by_user_id 5 #session[:professional]
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
  end

  def view_professional_activity
    @job_applications = JobApplication.find_all_by_user_id 5
    debugger
  end

  # TO SEND AN EMAIL
  # assume @user.name and @user.email have been declared

    #def send_welcome_email
      # triggered via:
      # http://localhost:3000/apply/send_welcome_email

      # note the deliver_ prefix, this is IMPORTANT
      #Postoffice.deliver_welcome(@user.name, @user.email)

      # optional, but I like to keep people informed
      #flash[:notice] = "You've successfuly registered. Please check your email for a confirmation!"

      # render the default action
      #render :action => 'index'  
    #end


end
