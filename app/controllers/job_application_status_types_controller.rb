class JobApplicationStatusTypesController < ApplicationController
  # GET /job_application_status_types
  # GET /job_application_status_types.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @job_application_status_types = JobApplicationStatusType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_application_status_types }
    end
  end

  # GET /job_application_status_types/1
  # GET /job_application_status_types/1.xml
  def show
    @job_application_status_type = JobApplicationStatusType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_application_status_type }
    end
  end

  # GET /job_application_status_types/new
  # GET /job_application_status_types/new.xml
  def new
    @job_application_status_type = JobApplicationStatusType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_application_status_type }
    end
  end

  # GET /job_application_status_types/1/edit
  def edit
    @job_application_status_type = JobApplicationStatusType.find(params[:id])
  end

  # POST /job_application_status_types
  # POST /job_application_status_types.xml
  def create
    @job_application_status_type = JobApplicationStatusType.new(params[:job_application_status_type])

    respond_to do |format|
      if @job_application_status_type.save
        flash[:notice] = 'JobApplicationStatusType was successfully created.'
        format.html { redirect_to(@job_application_status_type) }
        format.xml  { render :xml => @job_application_status_type, :status => :created, :location => @job_application_status_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_application_status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_application_status_types/1
  # PUT /job_application_status_types/1.xml
  def update
    @job_application_status_type = JobApplicationStatusType.find(params[:id])

    respond_to do |format|
      if @job_application_status_type.update_attributes(params[:job_application_status_type])
        flash[:notice] = 'JobApplicationStatusType was successfully updated.'
        format.html { redirect_to(@job_application_status_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application_status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_application_status_types/1
  # DELETE /job_application_status_types/1.xml
  def destroy
    @job_application_status_type = JobApplicationStatusType.find(params[:id])
    @job_application_status_type.destroy

    respond_to do |format|
      format.html { redirect_to(job_application_status_types_url) }
      format.xml  { head :ok }
    end
  end
end
