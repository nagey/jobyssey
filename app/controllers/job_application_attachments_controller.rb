class JobApplicationAttachmentsController < ApplicationController
  # GET /job_application_attachments
  # GET /job_application_attachments.xml
  
   layout 'index'
  
  def index
    @job_application_attachments = JobApplicationAttachment.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_application_attachments }
    end
  end

  # GET /job_application_attachments/1
  # GET /job_application_attachments/1.xml
  def show
    @job_application_attachment = JobApplicationAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_application_attachment }
    end
  end

  # GET /job_application_attachments/new
  # GET /job_application_attachments/new.xml
  def new
    @job_application_attachment = JobApplicationAttachment.new
    @job_applications = JobApplication.find :all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_application_attachment }
    end
  end

  # GET /job_application_attachments/1/edit
  def edit
    @job_application_attachment = JobApplicationAttachment.find(params[:id])
    @job_applications = JobApplication.find :all
  end

  # POST /job_application_attachments
  # POST /job_application_attachments.xml
  def create
    @job_application_attachment = JobApplicationAttachment.new(params[:job_application_attachment])
    @job_applications = JobApplication.find :all
    respond_to do |format|
      if @job_application_attachment.save
        flash[:notice] = 'JobApplicationAttachment was successfully created.'
        format.html { redirect_to(@job_application_attachment) }
        format.xml  { render :xml => @job_application_attachment, :status => :created, :location => @job_application_attachment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_application_attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_application_attachments/1
  # PUT /job_application_attachments/1.xml
  def update
    @job_application_attachment = JobApplicationAttachment.find(params[:id])

    respond_to do |format|
      if @job_application_attachment.update_attributes(params[:job_application_attachment])
        flash[:notice] = 'JobApplicationAttachment was successfully updated.'
        format.html { redirect_to(@job_application_attachment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application_attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_application_attachments/1
  # DELETE /job_application_attachments/1.xml
  def destroy
    @job_application_attachment = JobApplicationAttachment.find(params[:id])
    @job_application_attachment.destroy

    respond_to do |format|
      format.html { redirect_to(job_application_attachments_url) }
      format.xml  { head :ok }
    end
  end
end
