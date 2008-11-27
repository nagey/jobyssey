class ApplyController < ApplicationController
  
  before_filter :authenticate
  
  def apply
    @job_application = JobApplication.new 
    @user = Professional.find_by_id session[:user]
    @job_application.user = @user
    @job_application.job_posting = JobPosting.find params[:id]
    if @job_application.save
    
      @job_application_status = JobApplicationStatus.new
      @job_application_status.job_application = @job_application
      @job_application_status.job_application_state = JobApplicationState.find_by_name "Open Application"
      @job_application_status.active == true
      @job_application_status.user = @user
      @job_application_status.save
    
      #needs to send an email to employer
      @employer = @job_application.job_posting.employer
      @employer_employee = @employer.administrator
      @employer_email = @employer_employee.email
      @job_title = @job_application.job_posting.title
      @cv = @job_application.user.cv.attachment
      @professional = @job_application.user
      Emailer.deliver_new_application(@employer_email, @job_title, @professional) #@cv
      
      
      redirect_to :action => "youve_applied", :id => @job_application.id
    end
  end
  
  def youve_applied
    @job_application = JobApplication.find params[:id]
    @job_posting = @job_application.job_posting
  end
  
  def invite
    @job_application = JobApplication.new 
    @job_application.user = User.find params[:id]
    @job_application.job_posting = session[:job_posting]
    session[:job_application] = @job_application
    
    if @job_application.save
      @job_application_status = JobApplicationStatus.new
      @job_application_status.job_application = @job_application
      @job_application_status.job_application_state = JobApplicationState.find_by_name "Open Invitation"
      @job_application_status.active == true
      @job_application_status.user = @user
      @job_application_status.save
    
      #@job_application_status = JobApplicationStatus.new
      #@job_application_status.job_application_id = @job_application.id
      #@job_application_status.job_application_state_id = 0 #whichever id is invite
      #@job_application_status.active == true
      #@job_application_status.user_id = @job_application.user_id
    
      #needs to send an email to professional
      @professional = @job_application.user.email
      @job_title = @job_application.job_posting.title
      @employer = @job_application.job_posting.employer.name
    
      Emailer.deliver_new_invitation(@professional, @job_title, @employer)
      redirect_to :action => "youve_invited" 
    end
      
  end
  
  def youve_invited
     @job_application = session[:job_application]  #params[:id]
      @job_posting = @job_application.job_posting
  end
  
  def why_closing
  end
  
  def close_application 
    @job_application = JobApplication.find_by_id params[:id]
    @job_application_status = JobApplicationStatus.find_by_job_application_id @job_application
    @job_application_status.job_application_state = JobApplicationState.find_by_name "Closed Application- by employer"
    @job_application_status.save
    @job_application_status.active == false
    #@job_application_status.note = params[:note]

    flash[:notice] = "The application has been closed."
    redirect_to :action => "view_employer_activity"
  end  
  
  def view_employer_activity
    @job_postings = JobPosting.find_all_by_employer_id session[:employer]
    end

  def view_professional_activity
    @job_applications = JobApplication.find_all_by_user_id session[:user]
    @applies =[]
    @invites = []
    
    for job_application in @job_applications
      next if job_application.job_application_statuses.empty?
      next if job_application.job_application_statuses.last.job_application_state.nil?
      if (job_application.job_application_statuses.last.job_application_state.name == "Open Application") 
        @applies << job_application
      end
      next if job_application.job_application_statuses.empty?
            next if job_application.job_application_statuses.last.job_application_state.nil?
      if (job_application.job_application_statuses.last.job_application_state.name == "Open Invitation")
        @invites << job_application
      end
    end
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
