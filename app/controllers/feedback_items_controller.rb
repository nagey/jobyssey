class FeedbackItemsController < ApplicationController

  before_filter :authorize_admin


  # GET /feedback_items
  # GET /feedback_items.xml
  def index
    @feedback_items = FeedbackItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feedback_items }
    end
  end

  # GET /feedback_items/1
  # GET /feedback_items/1.xml
  def show
    @feedback_item = FeedbackItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feedback_item }
    end
  end

  # GET /feedback_items/new
  # GET /feedback_items/new.xml
  def new
    @feedback_item = FeedbackItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feedback_item }
    end
  end

  # GET /feedback_items/1/edit
  def edit
    @feedback_item = FeedbackItem.find(params[:id])
  end

  # POST /feedback_items
  # POST /feedback_items.xml
  def create
    @feedback_item = FeedbackItem.new(params[:feedback_item])

    respond_to do |format|
      if @feedback_item.save
        flash[:notice] = 'FeedbackItem was successfully created.'
        format.html { redirect_to(@feedback_item) }
        format.xml  { render :xml => @feedback_item, :status => :created, :location => @feedback_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feedback_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_items/1
  # PUT /feedback_items/1.xml
  def update
    @feedback_item = FeedbackItem.find(params[:id])

    respond_to do |format|
      if @feedback_item.update_attributes(params[:feedback_item])
        flash[:notice] = 'FeedbackItem was successfully updated.'
        format.html { redirect_to(@feedback_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feedback_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_items/1
  # DELETE /feedback_items/1.xml
  def destroy
    @feedback_item = FeedbackItem.find(params[:id])
    @feedback_item.destroy

    respond_to do |format|
      format.html { redirect_to(feedback_items_url) }
      format.xml  { head :ok }
    end
  end
end
