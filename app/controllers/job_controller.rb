class JobController < ApplicationController
  
  def index
    @job_specs = JobSpecs.new  
  end

  def create
    @job_posting = JobPosting.new params[:job_posting]
    @job_posting.employer_id = session[:user].employer.id
    session[:job_posting] = @job_posting
    @job_posting.job_specs = session[:job_specs] unless session[:job_specs].nil?

    if @job_posting.save!
      session[:job_posting] = @job_posting
      redirect_to :controller => "skillset", :action => "start_job_posting_skills", :id => @job_posting.id
      return
    else
      redirect_to :action => "new"
      flash[:notice] = "Didn't work- please email your Jobyssey contact for further assistance."
      return
    end
  end
 
  def new
    @job_specs = JobSpecs.new params[:job_specs] unless params[:job_specs].nil? 
    session[:job_specs] = @job_specs unless @job_specs.nil? 
    @job_posting = JobPosting.new
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
  end

  def view
    @job_posting = JobPosting.find_by_id params[:id] #session[:job_posting] 
    session[:employer] = session[:job_posting].employer_id
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
  end
      

end
