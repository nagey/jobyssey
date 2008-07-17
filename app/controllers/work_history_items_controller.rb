class WorkHistoryItemsController < ApplicationController
  # GET /work_history_items
  # GET /work_history_items.xml
  
     layout 'index'
  
  def index
    @work_history_items = WorkHistoryItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_history_items }
    end
  end

  # GET /work_history_items/1
  # GET /work_history_items/1.xml
  def show
    @work_history_item = WorkHistoryItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work_history_item }
    end
  end

  # GET /work_history_items/new
  # GET /work_history_items/new.xml
  def new
    @work_history_item = WorkHistoryItem.new
    @users = User.find :all
    @job_titles = JobTitle.find :all
    @geo_positions = GeoPosition.find :all
    @administrative_divisions = AdministrativeDivision.find :all
    @towns = Town.find :all
    @countries = Country.find :all
    @employers = Employer.find :all
    @employment_types = EmploymentType.find :all
    @working_times = WorkingTime.find :all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_history_item }
    end
  end

  # GET /work_history_items/1/edit
  def edit
    @work_history_item = WorkHistoryItem.find(params[:id])
    @users = User.find :all
    @job_titles = JobTitle.find :all
    @geo_positions = GeoPosition.find :all
    @administrative_divisions = AdministrativeDivision.find :all
    @towns = Town.find :all
    @countries = Country.find :all
    @employers = Employer.find :all
    @employment_types = EmploymentType.find :all
    @working_times = WorkingTime.find :all
  end

  # POST /work_history_items
  # POST /work_history_items.xml
  def create
    @work_history_item = WorkHistoryItem.new(params[:work_history_item])
    @users = User.find :all
    @job_titles = JobTitle.find :all
    @geo_positions = GeoPosition.find :all
    @administrative_divisions = AdministrativeDivision.find :all
    @towns = Town.find :all
    @countries = Country.find :all
    @employers = Employer.find :all
    @employment_types = EmploymentType.find :all
    @working_times = WorkingTime.find :all
    respond_to do |format|
      if @work_history_item.save
        flash[:notice] = 'WorkHistoryItem was successfully created.'
        format.html { redirect_to(@work_history_item) }
        format.xml  { render :xml => @work_history_item, :status => :created, :location => @work_history_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work_history_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /work_history_items/1
  # PUT /work_history_items/1.xml
  def update
    @work_history_item = WorkHistoryItem.find(params[:id])

    respond_to do |format|
      if @work_history_item.update_attributes(params[:work_history_item])
        flash[:notice] = 'WorkHistoryItem was successfully updated.'
        format.html { redirect_to(@work_history_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_history_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /work_history_items/1
  # DELETE /work_history_items/1.xml
  def destroy
    @work_history_item = WorkHistoryItem.find(params[:id])
    @work_history_item.destroy

    respond_to do |format|
      format.html { redirect_to(work_history_items_url) }
      format.xml  { head :ok }
    end
  end
end
