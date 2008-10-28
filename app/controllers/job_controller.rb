class JobController < ApplicationController
  def index
    @jobs = JobPosting.find_all_by_employer_id 1
  end

  def create
    @job_posting = JobPosting.new params[:job_posting]
    session[:job_posting] = @job_posting
    
    if @job_posting.save!
      redirect_to :controller => "skillset", :action => "start_job_posting_skills"
      return
    else
      redirect_to :action => "new"
      flash[:notice] = "Didn't work- try again!"
      return
    end
  end
  
  def update
   
  end

  def edit 
    @job = JobPosting.find params[:id]
    
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
  end
  
  def add_skill
    @new_skill = JobPostingRequirement.new  
    @job = JobPosting.find params[:id]
    @skills = Skill.find(:all)
    @skills_not_in_job = []
    
    @new_skill.job_posting = @job
    
    @skills.each do |skill|
      unless (@job.metrics.member? skill)
        @skills_not_in_job << skill
        #break
      end
    end
  end
    
  def submit_new_skill
     new_skill = JobPostingRequirement.new params[:job_posting_requirement]
     new_skill.save
     job_id = new_skill.job_posting_id
     redirect_to :action => "skills", :id => job_id
  end
    
    
  def delete_skill
     job_posting_requirement = JobPostingRequirement.find (params[:id])
     job_id = job_posting_requirement.job_posting_id
     
     job_posting_requirement.destroy
     
     redirect_to :action => "skills", :id => job_id
  end
  
  def show
    @job = JobPosting.find_by_id 1
  end

  def skills
    @job = JobPosting.find_by_id params[:id]
    @job_skills = JobPostingRequirement.find_all_by_job_posting_id @job.id  
    
    
    #sample code
    #all_skills = Skill.find(:all)
    
    #all_skills.each do |skill|
    #  unless (@job.metrics.member? skill)
    #    @job.metrics << skill     
    #    break
    #  end
    #end
    ##@job.metrics << Skill.find(:all).first
    
    #@job.save!
    
    #@skills = @job.skills
    
    
  end

  def personal_qualities
  end

  def preview
  end

  def new
    @job_posting = JobPosting.new
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
    session[:employer_id] = session[:user].employer_id
    #debugger
  end

  def view
    @job_posting = session[:job_posting] 
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
  end
      

end