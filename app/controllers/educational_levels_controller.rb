class EducationalLevelsController < ApplicationController
  # GET /educational_levels
  # GET /educational_levels.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @educational_levels = EducationalLevel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @educational_levels }
    end
  end

  # GET /educational_levels/1
  # GET /educational_levels/1.xml
  def show
    @educational_level = EducationalLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @educational_level }
    end
  end

  # GET /educational_levels/new
  # GET /educational_levels/new.xml
  def new
    @educational_level = EducationalLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @educational_level }
    end
  end

  # GET /educational_levels/1/edit
  def edit
    @educational_level = EducationalLevel.find(params[:id])
  end

  # POST /educational_levels
  # POST /educational_levels.xml
  def create
    @educational_level = EducationalLevel.new(params[:educational_level])

    respond_to do |format|
      if @educational_level.save
        flash[:notice] = 'EducationalLevel was successfully created.'
        format.html { redirect_to(@educational_level) }
        format.xml  { render :xml => @educational_level, :status => :created, :location => @educational_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @educational_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /educational_levels/1
  # PUT /educational_levels/1.xml
  def update
    @educational_level = EducationalLevel.find(params[:id])

    respond_to do |format|
      if @educational_level.update_attributes(params[:educational_level])
        flash[:notice] = 'EducationalLevel was successfully updated.'
        format.html { redirect_to(@educational_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @educational_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /educational_levels/1
  # DELETE /educational_levels/1.xml
  def destroy
    @educational_level = EducationalLevel.find(params[:id])
    @educational_level.destroy

    respond_to do |format|
      format.html { redirect_to(educational_levels_url) }
      format.xml  { head :ok }
    end
  end
end
