class JobApplicationStatesController < ApplicationController
  # GET /job_application_states
  # GET /job_application_states.xml
  def index
    @job_application_states = JobApplicationState.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_application_states }
    end
  end

  # GET /job_application_states/1
  # GET /job_application_states/1.xml
  def show
    @job_application_state = JobApplicationState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_application_state }
    end
  end

  # GET /job_application_states/new
  # GET /job_application_states/new.xml
  def new
    @job_application_state = JobApplicationState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_application_state }
    end
  end

  # GET /job_application_states/1/edit
  def edit
    @job_application_state = JobApplicationState.find(params[:id])
  end

  # POST /job_application_states
  # POST /job_application_states.xml
  def create
    @job_application_state = JobApplicationState.new(params[:job_application_state])

    respond_to do |format|
      if @job_application_state.save
        flash[:notice] = 'JobApplicationState was successfully created.'
        format.html { redirect_to(@job_application_state) }
        format.xml  { render :xml => @job_application_state, :status => :created, :location => @job_application_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_application_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_application_states/1
  # PUT /job_application_states/1.xml
  def update
    @job_application_state = JobApplicationState.find(params[:id])

    respond_to do |format|
      if @job_application_state.update_attributes(params[:job_application_state])
        flash[:notice] = 'JobApplicationState was successfully updated.'
        format.html { redirect_to(@job_application_state) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_application_states/1
  # DELETE /job_application_states/1.xml
  def destroy
    @job_application_state = JobApplicationState.find(params[:id])
    @job_application_state.destroy

    respond_to do |format|
      format.html { redirect_to(job_application_states_url) }
      format.xml  { head :ok }
    end
  end
end
