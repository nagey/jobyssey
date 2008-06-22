class PersonalQualitiesController < ApplicationController
  # GET /personal_qualities
  # GET /personal_qualities.xml
  def index
    @personal_qualities = PersonalQuality.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @personal_qualities }
    end
  end

  # GET /personal_qualities/1
  # GET /personal_qualities/1.xml
  def show
    @personal_quality = PersonalQuality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @personal_quality }
    end
  end

  # GET /personal_qualities/new
  # GET /personal_qualities/new.xml
  def new
    @personal_quality = PersonalQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @personal_quality }
    end
  end

  # GET /personal_qualities/1/edit
  def edit
    @personal_quality = PersonalQuality.find(params[:id])
  end

  # POST /personal_qualities
  # POST /personal_qualities.xml
  def create
    @personal_quality = PersonalQuality.new(params[:personal_quality])

    respond_to do |format|
      if @personal_quality.save
        flash[:notice] = 'PersonalQuality was successfully created.'
        format.html { redirect_to(@personal_quality) }
        format.xml  { render :xml => @personal_quality, :status => :created, :location => @personal_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @personal_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personal_qualities/1
  # PUT /personal_qualities/1.xml
  def update
    @personal_quality = PersonalQuality.find(params[:id])

    respond_to do |format|
      if @personal_quality.update_attributes(params[:personal_quality])
        flash[:notice] = 'PersonalQuality was successfully updated.'
        format.html { redirect_to(@personal_quality) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @personal_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_qualities/1
  # DELETE /personal_qualities/1.xml
  def destroy
    @personal_quality = PersonalQuality.find(params[:id])
    @personal_quality.destroy

    respond_to do |format|
      format.html { redirect_to(personal_qualities_url) }
      format.xml  { head :ok }
    end
  end
end
