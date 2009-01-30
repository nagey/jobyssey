class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.xml
  
  layout 'index'
  before_filter :authorize_admin
  
  def index
    @index
    @addresses = Address.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new
    @towns = Town.find :all
    @geo_positions = GeoPosition.find :all
    @employers = Employer.find :all
    

    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
    @towns = Town.find :all
    @geo_positions = GeoPosition.find :all
  end

  # POST /addresses
  # POST /addresses.xml
 
  def create
    @address = Address.new
    @address.update_attributes params[:address]
    @towns = Town.find :all
    @geo_positions = GeoPosition.find :all
    @employer = Employer.find_by_id params[:address][:employer_id]
        
    @employer.addresses << @address

    respond_to do |format|
      if @address.save
        flash[:notice] = 'Address was successfully created.'
        #format.html { redirect_to(@address) }
        #format.xml  { render :xml => @address, :status => :created, :location => @address }
        redirect_to :action => "index"
        return
      else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
        flash[:notice] = "Didn't work, try again!"
        redirect_to :action => "new"
        return
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = 'Address was successfully updated.'
        format.html { redirect_to(@address) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
