class RequiredDegreesController < ApplicationController
  # GET /required_degrees
  # GET /required_degrees.xml
  before_filter :authorize_admin
  
   layout 'index'
  
  def index
    @required_degrees = RequiredDegree.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @required_degrees }
    end
  end

  # GET /required_degrees/1
  # GET /required_degrees/1.xml
  def show
    @required_degree = RequiredDegree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @required_degree }
    end
  end

  # GET /required_degrees/new
  # GET /required_degrees/new.xml
  def new
    @required_degree = RequiredDegree.new
    @job_postings = JobPosting.find :all
    @education_concentrations = EducationConcentration.find :all
    @educational_levels = EducationalLevel.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @required_degree }
    end
  end

  # GET /required_degrees/1/edit
  def edit
    @required_degree = RequiredDegree.find(params[:id])
    @job_postings = JobPosting.find :all
    @education_concentrations = EducationConcentrations.find :all
    @educational_levels = EducationalLevel.find :all
  end

  # POST /required_degrees
  # POST /required_degrees.xml
  def create
    @required_degree = RequiredDegree.new(params[:required_degree])
    @job_postings = JobPosting.find :all
    @education_concentrations = EducationConcentration.find :all
    @educational_levels = EducationalLevel.find :all
    respond_to do |format|
      if @required_degree.save
        flash[:notice] = 'RequiredDegree was successfully created.'
        format.html { redirect_to(@required_degree) }
        format.xml  { render :xml => @required_degree, :status => :created, :location => @required_degree }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @required_degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /required_degrees/1
  # PUT /required_degrees/1.xml
  def update
    @required_degree = RequiredDegree.find(params[:id])

    respond_to do |format|
      if @required_degree.update_attributes(params[:required_degree])
        flash[:notice] = 'RequiredDegree was successfully updated.'
        format.html { redirect_to(@required_degree) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @required_degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /required_degrees/1
  # DELETE /required_degrees/1.xml
  def destroy
    @required_degree = RequiredDegree.find(params[:id])
    @required_degree.destroy

    respond_to do |format|
      format.html { redirect_to(required_degrees_url) }
      format.xml  { head :ok }
    end
  end
end
