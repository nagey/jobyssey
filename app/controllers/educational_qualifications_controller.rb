class EducationalQualificationsController < ApplicationController
  # GET /educational_qualifications
  # GET /educational_qualifications.xml
  
   layout 'index'
  
  def index
    @educational_qualifications = EducationalQualification.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @educational_qualifications }
    end
  end

  # GET /educational_qualifications/1
  # GET /educational_qualifications/1.xml
  def show
    @educational_qualification = EducationalQualification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @educational_qualification }
    end
  end

  # GET /educational_qualifications/new
  # GET /educational_qualifications/new.xml
  def new
    @educational_qualification = EducationalQualification.new
    @educational_levels = EducationalLevel.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @educational_qualification }
    end
  end

  # GET /educational_qualifications/1/edit
  def edit
    @educational_qualification = EducationalQualification.find(params[:id])
    @educational_levels = EducationalLevel.find :all
  end

  # POST /educational_qualifications
  # POST /educational_qualifications.xml
  def create
    @educational_qualification = EducationalQualification.new(params[:educational_qualification])

    respond_to do |format|
      if @educational_qualification.save
        flash[:notice] = 'EducationalQualification was successfully created.'
        format.html { redirect_to(@educational_qualification) }
        format.xml  { render :xml => @educational_qualification, :status => :created, :location => @educational_qualification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @educational_qualification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /educational_qualifications/1
  # PUT /educational_qualifications/1.xml
  def update
    @educational_qualification = EducationalQualification.find(params[:id])

    respond_to do |format|
      if @educational_qualification.update_attributes(params[:educational_qualification])
        flash[:notice] = 'EducationalQualification was successfully updated.'
        format.html { redirect_to(@educational_qualification) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @educational_qualification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /educational_qualifications/1
  # DELETE /educational_qualifications/1.xml
  def destroy
    @educational_qualification = EducationalQualification.find(params[:id])
    @educational_qualification.destroy

    respond_to do |format|
      format.html { redirect_to(educational_qualifications_url) }
      format.xml  { head :ok }
    end
  end
end
