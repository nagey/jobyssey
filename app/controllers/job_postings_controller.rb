class JobPostingsController < ApplicationController
  # GET /job_postings
  # GET /job_postings.xml
  
   layout 'index'
  
  def index
    @job_postings = JobPosting.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_postings }
    end
  end

  # GET /job_postings/1
  # GET /job_postings/1.xml
  def show
    @job_posting = JobPosting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_posting }
    end
  end

  # GET /job_postings/new
  # GET /job_postings/new.xml
  def new
    @job_posting = JobPosting.new
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_posting }
    end
  end

  # GET /job_postings/1/edit
  def edit
    @job_posting = JobPosting.find(params[:id])
    @employers = Employer.find :all
    @working_times = WorkingTime.find :all
    @employment_types = EmploymentType.find :all
  end

  # POST /job_postings
  # POST /job_postings.xml
  def create
    @job_posting = JobPosting.new(params[:job_posting])

    respond_to do |format|
      if @job_posting.save
        flash[:notice] = 'JobPosting was successfully created.'
        format.html { redirect_to(@job_posting) }
        format.xml  { render :xml => @job_posting, :status => :created, :location => @job_posting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_posting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_postings/1
  # PUT /job_postings/1.xml
  def update
    @job_posting = JobPosting.find(params[:id])

    respond_to do |format|
      if @job_posting.update_attributes(params[:job_posting])
        flash[:notice] = 'JobPosting was successfully updated.'
        format.html { redirect_to(@job_posting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_posting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.xml
  def destroy
    @job_posting = JobPosting.find(params[:id])
    @job_posting.destroy

    respond_to do |format|
      format.html { redirect_to(job_postings_url) }
      format.xml  { head :ok }
    end
  end
  
  def find
  end
  
end
