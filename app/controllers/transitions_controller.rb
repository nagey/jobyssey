class TransitionsController < ApplicationController
  # GET /transitions
  # GET /transitions.xml
  
   layout 'index'
  
  def index
    @transitions = Transition.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transitions }
    end
  end

  # GET /transitions/1
  # GET /transitions/1.xml
  def show
    @transition = Transition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transition }
    end
  end

  # GET /transitions/new
  # GET /transitions/new.xml
  def new
    @transition = Transition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transition }
    end
  end

  # GET /transitions/1/edit
  def edit
    @transition = Transition.find(params[:id])
  end

  # POST /transitions
  # POST /transitions.xml
  def create
    @transition = Transition.new(params[:transition])

    respond_to do |format|
      if @transition.save
        flash[:notice] = 'Transition was successfully created.'
        format.html { redirect_to(@transition) }
        format.xml  { render :xml => @transition, :status => :created, :location => @transition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transitions/1
  # PUT /transitions/1.xml
  def update
    @transition = Transition.find(params[:id])

    respond_to do |format|
      if @transition.update_attributes(params[:transition])
        flash[:notice] = 'Transition was successfully updated.'
        format.html { redirect_to(@transition) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transitions/1
  # DELETE /transitions/1.xml
  def destroy
    @transition = Transition.find(params[:id])
    @transition.destroy

    respond_to do |format|
      format.html { redirect_to(transitions_url) }
      format.xml  { head :ok }
    end
  end
end
