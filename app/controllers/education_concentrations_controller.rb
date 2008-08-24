class EducationConcentrationsController < ApplicationController
  # GET /education_concentrations
  # GET /education_concentrations.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @education_concentrations = EducationConcentration.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @education_concentrations }
    end
  end

  # GET /education_concentrations/1
  # GET /education_concentrations/1.xml
  def show
    @education_concentration = EducationConcentration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @education_concentration }
    end
  end

  # GET /education_concentrations/new
  # GET /education_concentrations/new.xml
  def new
    @education_concentration = EducationConcentration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @education_concentration }
    end
  end

  # GET /education_concentrations/1/edit
  def edit
    @education_concentration = EducationConcentration.find(params[:id])
  end

  # POST /education_concentrations
  # POST /education_concentrations.xml
  def create
    @education_concentration = EducationConcentration.new(params[:education_concentration])

    respond_to do |format|
      if @education_concentration.save
        flash[:notice] = 'EducationConcentration was successfully created.'
        format.html { redirect_to(@education_concentration) }
        format.xml  { render :xml => @education_concentration, :status => :created, :location => @education_concentration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @education_concentration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /education_concentrations/1
  # PUT /education_concentrations/1.xml
  def update
    @education_concentration = EducationConcentration.find(params[:id])

    respond_to do |format|
      if @education_concentration.update_attributes(params[:education_concentration])
        flash[:notice] = 'EducationConcentration was successfully updated.'
        format.html { redirect_to(@education_concentration) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @education_concentration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /education_concentrations/1
  # DELETE /education_concentrations/1.xml
  def destroy
    @education_concentration = EducationConcentration.find(params[:id])
    @education_concentration.destroy

    respond_to do |format|
      format.html { redirect_to(education_concentrations_url) }
      format.xml  { head :ok }
    end
  end
end
