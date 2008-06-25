class GeoPositionsController < ApplicationController
  # GET /geo_positions
  # GET /geo_positions.xml
  def index
    @geo_positions = Geo_position.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @geo_positions }
    end
  end

  # GET /geo_positions/1
  # GET /geo_positions/1.xml
  def show
    @geo_position = GeoPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @geo_position }
    end
  end

  # GET /geo_positions/new
  # GET /geo_positions/new.xml
  def new
    @geo_position = GeoPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @geo_position }
    end
  end

  # GET /geo_positions/1/edit
  def edit
    @geo_position = GeoPosition.find(params[:id])
  end

  # POST /geo_positions
  # POST /geo_positions.xml
  def create
    @geo_position = GeoPosition.new(params[:geo_position])

    respond_to do |format|
      if @geo_position.save
        flash[:notice] = 'GeoPosition was successfully created.'
        format.html { redirect_to(@geo_position) }
        format.xml  { render :xml => @geo_position, :status => :created, :location => @geo_position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @geo_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /geo_positions/1
  # PUT /geo_positions/1.xml
  def update
    @geo_position = GeoPosition.find(params[:id])

    respond_to do |format|
      if @geo_position.update_attributes(params[:geo_position])
        flash[:notice] = 'GeoPosition was successfully updated.'
        format.html { redirect_to(@geo_position) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @geo_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /geo_positions/1
  # DELETE /geo_positions/1.xml
  def destroy
    @geo_position = GeoPosition.find(params[:id])
    @geo_position.destroy

    respond_to do |format|
      format.html { redirect_to(geo_positions_url) }
      format.xml  { head :ok }
    end
  end
end
