class PostCodesController < ApplicationController
  # GET /post_codes
  # GET /post_codes.xml
  def index
    @post_codes = PostCode.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_codes }
    end
  end

  # GET /post_codes/1
  # GET /post_codes/1.xml
  def show
    @post_code = PostCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_code }
    end
  end

  # GET /post_codes/new
  # GET /post_codes/new.xml
  def new
    @post_code = PostCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_code }
    end
  end

  # GET /post_codes/1/edit
  def edit
    @post_code = PostCode.find(params[:id])
  end

  # POST /post_codes
  # POST /post_codes.xml
  def create
    @post_code = PostCode.new(params[:post_code])

    respond_to do |format|
      if @post_code.save
        flash[:notice] = 'PostCode was successfully created.'
        format.html { redirect_to(@post_code) }
        format.xml  { render :xml => @post_code, :status => :created, :location => @post_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_codes/1
  # PUT /post_codes/1.xml
  def update
    @post_code = PostCode.find(params[:id])

    respond_to do |format|
      if @post_code.update_attributes(params[:post_code])
        flash[:notice] = 'PostCode was successfully updated.'
        format.html { redirect_to(@post_code) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_codes/1
  # DELETE /post_codes/1.xml
  def destroy
    @post_code = PostCode.find(params[:id])
    @post_code.destroy

    respond_to do |format|
      format.html { redirect_to(post_codes_url) }
      format.xml  { head :ok }
    end
  end
end
