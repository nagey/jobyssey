class JobPostingRequirementsController < ApplicationController
  # GET /job_posting_requirements
  # GET /job_posting_requirements.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @job_posting_requirements = JobPostingRequirement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_posting_requirements }
    end
  end

  # GET /job_posting_requirements/1
  # GET /job_posting_requirements/1.xml
  def show
    @job_posting_requirement = JobPostingRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_posting_requirement }
    end
  end

  # GET /job_posting_requirements/new
  # GET /job_posting_requirements/new.xml
  def new
    @job_posting_requirement = JobPostingRequirement.new
    @job_postings = JobPosting.find :all
    @metrics = Metric.find :all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_posting_requirement }
    end
  end

  # GET /job_posting_requirements/1/edit
  def edit
    @job_posting_requirement = JobPostingRequirement.find(params[:id])
    @job_postings = JobPosting.find :all
    @metrics = Metric.find :all
  end

  # POST /job_posting_requirements
  # POST /job_posting_requirements.xml
  def create
    @job_posting_requirement = JobPostingRequirement.new(params[:personal_quality])
    @job_postings = JobPosting.find :all
    @metrics = Metric.find :all
      
    respond_to do |format|
      if @job_posting_requirement.save
        flash[:notice] = 'JobPostingRequirement was successfully created.'
        format.html { redirect_to(@job_posting_requirement) }
        format.xml  { render :xml => @job_posting_requirement, :status => :created, :location => @job_posting_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_posting_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_posting_requirements/1
  # PUT /job_posting_requirements/1.xml
  def update
    @job_posting_requirement = JobPostingRequirement.find(params[:id])

    respond_to do |format|
      if @job_posting_requirement.update_attributes(params[:job_posting_requirement])
        flash[:notice] = 'JobPostingRequirement was successfully updated.'
        format.html { redirect_to(@job_posting_requirement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_posting_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_posting_requirements/1
  # DELETE /job_posting_requirements/1.xml
  def destroy
    @personal_quality = JobPostingRequirement.find(params[:id])
    @personal_quality.destroy

    respond_to do |format|
      format.html { redirect_to(job_posting_requirements) }
      format.xml  { head :ok }
    end
  end
end
