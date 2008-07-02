class AccountsController < ApplicationController
  # GET /admin/accounts
  # GET /admin/accounts.xml
  
   layout 'index'
  
  def index
    @accounts = Account.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /admin/accounts/1
  # GET /admin/accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /admin/accounts/new
  # GET /admin/accounts/new.xml
  def new
    @account = Account.new
    @employers = Employer.find :all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /admin/accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @employers = Employer.find :all
  end

  # POST /admin/accounts
  # POST /admin/accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to(@account) }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/accounts/1
  # PUT /admin/accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/accounts/1
  # DELETE /admin/accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
end
