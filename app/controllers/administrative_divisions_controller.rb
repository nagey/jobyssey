class AdministrativeDivisionsController < ApplicationController
  # GET /administrative_divisions
  # GET /administrative_divisions.xml
  def index
    @administrative_divisions = AdministrativeDivision.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @administrative_divisions }
    end
  end

  # GET /administrative_divisions/1
  # GET /administrative_divisions/1.xml
  def show
    @administrative_division = AdministrativeDivision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administrative_division }
    end
  end

  # GET /administrative_divisions/new
  # GET /administrative_divisions/new.xml
  def new
    @administrative_division = AdministrativeDivision.new
      @country = Country.find :all
      @geo_position = GeoPosition.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administrative_division }
    end
  end

  # GET /administrative_divisions/1/edit
  def edit
    @administrative_division = AdministrativeDivision.find(params[:id])
     @country = Country.find :all
      @geo_position = GeoPosition.find :all
  end

  # POST /administrative_divisions
  # POST /administrative_divisions.xml
  def create
    @administrative_division = AdministrativeDivision.new(params[:administrative_division])

    respond_to do |format|
      if @administrative_division.save
        flash[:notice] = 'AdministrativeDivision was successfully created.'
        format.html { redirect_to(@administrative_division) }
        format.xml  { render :xml => @administrative_division, :status => :created, :location => @administrative_division }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @administrative_division.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /administrative_divisions/1
  # PUT /administrative_divisions/1.xml
  def update
    @administrative_division = AdministrativeDivision.find(params[:id])

    respond_to do |format|
      if @administrative_division.update_attributes(params[:administrative_division])
        flash[:notice] = 'AdministrativeDivision was successfully updated.'
        format.html { redirect_to(@administrative_division) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @administrative_division.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /administrative_divisions/1
  # DELETE /administrative_divisions/1.xml
  def destroy
    @administrative_division = AdministrativeDivision.find(params[:id])
    @administrative_division.destroy

    respond_to do |format|
      format.html { redirect_to(administrative_divisions_url) }
      format.xml  { head :ok }
    end
  end
end
