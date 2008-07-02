class JobApplicationStatusesController < ApplicationController
  # GET /job_application_statuses
  # GET /job_application_statuses.xml
  
   layout 'index'
  
  def index
    @job_application_statuses = JobApplicationStatus.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_application_statuses }
    end
  end

  # GET /job_application_statuses/1
  # GET /job_application_statuses/1.xml
  def show
    @job_application_status = JobApplicationStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_application_status }
    end
  end

  # GET /job_application_statuses/new
  # GET /job_application_statuses/new.xml
  def new
    @job_application_status = JobApplicationStatus.new
    @job_applications = JobApplication.find :all
    @job_application_states = JobApplicationState.find :all
    @users = User.find :all
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_application_status }
    end
  end

  # GET /job_application_statuses/1/edit
  def edit
    @job_application_status = JobApplicationStatus.find(params[:id])
    @job_applications = JobApplication.find :all
    @job_application_states = JobApplicationState.find :all
    @users = User.find :all
  end

  # POST /job_application_statuses
  # POST /job_application_statuses.xml
  def create
    @job_application_status = JobApplicationStatus.new(params[:job_application_status])

    respond_to do |format|
      if @job_application_status.save
        flash[:notice] = 'JobApplicationStatus was successfully created.'
        format.html { redirect_to(@job_application_status) }
        format.xml  { render :xml => @job_application_status, :status => :created, :location => @job_application_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_application_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_application_statuses/1
  # PUT /job_application_statuses/1.xml
  def update
    @job_application_status = JobApplicationStatus.find(params[:id])

    respond_to do |format|
      if @job_application_status.update_attributes(params[:job_application_status])
        flash[:notice] = 'JobApplicationStatus was successfully updated.'
        format.html { redirect_to(@job_application_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_application_statuses/1
  # DELETE /job_application_statuses/1.xml
  def destroy
    @job_application_status = JobApplicationStatus.find(params[:id])
    @job_application_status.destroy

    respond_to do |format|
      format.html { redirect_to(job_application_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
