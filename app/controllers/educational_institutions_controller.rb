class EducationalInstitutionsController < ApplicationController
  # GET /educational_institutions
  # GET /educational_institutions.xml
  def index
    @educational_institutions = EducationalInstitution.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @educational_institutions }
    end
  end

  # GET /educational_institutions/1
  # GET /educational_institutions/1.xml
  def show
    @educational_institution = EducationalInstitution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @educational_institution }
    end
  end

  # GET /educational_institutions/new
  # GET /educational_institutions/new.xml
  def new
    @educational_institution = EducationalInstitution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @educational_institution }
    end
  end

  # GET /educational_institutions/1/edit
  def edit
    @educational_institution = EducationalInstitution.find(params[:id])
  end

  # POST /educational_institutions
  # POST /educational_institutions.xml
  def create
    @educational_institution = EducationalInstitution.new(params[:educational_institution])

    respond_to do |format|
      if @educational_institution.save
        flash[:notice] = 'EducationalInstitution was successfully created.'
        format.html { redirect_to(@educational_institution) }
        format.xml  { render :xml => @educational_institution, :status => :created, :location => @educational_institution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @educational_institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /educational_institutions/1
  # PUT /educational_institutions/1.xml
  def update
    @educational_institution = EducationalInstitution.find(params[:id])

    respond_to do |format|
      if @educational_institution.update_attributes(params[:educational_institution])
        flash[:notice] = 'EducationalInstitution was successfully updated.'
        format.html { redirect_to(@educational_institution) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @educational_institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /educational_institutions/1
  # DELETE /educational_institutions/1.xml
  def destroy
    @educational_institution = EducationalInstitution.find(params[:id])
    @educational_institution.destroy

    respond_to do |format|
      format.html { redirect_to(educational_institutions_url) }
      format.xml  { head :ok }
    end
  end
end
