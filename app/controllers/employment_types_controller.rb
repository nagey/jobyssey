class EmploymentTypesController < ApplicationController
  # GET /employment_types
  # GET /employment_types.xml
  def index
    @employment_types = EmploymentType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employment_types }
    end
  end

  # GET /employment_types/1
  # GET /employment_types/1.xml
  def show
    @employment_type = EmploymentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employment_type }
    end
  end

  # GET /employment_types/new
  # GET /employment_types/new.xml
  def new
    @employment_type = EmploymentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employment_type }
    end
  end

  # GET /employment_types/1/edit
  def edit
    @employment_type = EmploymentType.find(params[:id])
  end

  # POST /employment_types
  # POST /employment_types.xml
  def create
    @employment_type = EmploymentType.new(params[:employment_type])

    respond_to do |format|
      if @employment_type.save
        flash[:notice] = 'EmploymentType was successfully created.'
        format.html { redirect_to(@employment_type) }
        format.xml  { render :xml => @employment_type, :status => :created, :location => @employment_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employment_types/1
  # PUT /employment_types/1.xml
  def update
    @employment_type = EmploymentType.find(params[:id])

    respond_to do |format|
      if @employment_type.update_attributes(params[:employment_type])
        flash[:notice] = 'EmploymentType was successfully updated.'
        format.html { redirect_to(@employment_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employment_types/1
  # DELETE /employment_types/1.xml
  def destroy
    @employment_type = EmploymentType.find(params[:id])
    @employment_type.destroy

    respond_to do |format|
      format.html { redirect_to(employment_types_url) }
      format.xml  { head :ok }
    end
  end
end
