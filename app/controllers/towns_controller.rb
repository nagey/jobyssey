class TownsController < ApplicationController
  # GET /towns
  # GET /towns.xml
  def index
    @towns = Town.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @towns }
    end
  end

  # GET /towns/1
  # GET /towns/1.xml
  def show
    @town = Town.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @town }
    end
  end

  # GET /towns/new
  # GET /towns/new.xml
  def new
    @town = Town.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @town }
    end
  end

  # GET /towns/1/edit
  def edit
    @town = Town.find(params[:id])
  end

  # POST /towns
  # POST /towns.xml
  def create
    @town = Town.new(params[:town])

    respond_to do |format|
      if @town.save
        flash[:notice] = 'Town was successfully created.'
        format.html { redirect_to(@town) }
        format.xml  { render :xml => @town, :status => :created, :location => @town }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @town.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /towns/1
  # PUT /towns/1.xml
  def update
    @town = Town.find(params[:id])

    respond_to do |format|
      if @town.update_attributes(params[:town])
        flash[:notice] = 'Town was successfully updated.'
        format.html { redirect_to(@town) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @town.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /towns/1
  # DELETE /towns/1.xml
  def destroy
    @town = Town.find(params[:id])
    @town.destroy

    respond_to do |format|
      format.html { redirect_to(towns_url) }
      format.xml  { head :ok }
    end
  end
end
