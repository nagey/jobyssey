class BenefitsController < ApplicationController
  # GET /benefits
  # GET /benefits.xml
  
   layout 'index'
  
  def index
    @benefits = Benefit.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @benefits }
    end
  end

  # GET /benefits/1
  # GET /benefits/1.xml
  def show
    @benefit = Benefit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @benefit }
    end
  end

  # GET /benefits/new
  # GET /benefits/new.xml
  def new
    @benefit = Benefit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @benefit }
    end
  end

  # GET /benefits/1/edit
  def edit
    @benefit = Benefit.find(params[:id])
  end

  # POST /benefits
  # POST /benefits.xml
  def create
    @benefit = Benefit.new(params[:benefit])

    respond_to do |format|
      if @benefit.save
        flash[:notice] = 'Benefit was successfully created.'
        format.html { redirect_to(@benefit) }
        format.xml  { render :xml => @benefit, :status => :created, :location => @benefit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @benefit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /benefits/1
  # PUT /benefits/1.xml
  def update
    @benefit = Benefit.find(params[:id])

    respond_to do |format|
      if @benefit.update_attributes(params[:benefit])
        flash[:notice] = 'Benefit was successfully updated.'
        format.html { redirect_to(@benefit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @benefit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /benefits/1
  # DELETE /benefits/1.xml
  def destroy
    @benefit = Benefit.find(params[:id])
    @benefit.destroy

    respond_to do |format|
      format.html { redirect_to(benefits_url) }
      format.xml  { head :ok }
    end
  end
end
