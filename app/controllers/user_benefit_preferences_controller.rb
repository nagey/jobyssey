class UserBenefitPreferencesController < ApplicationController
  # GET /user_benefit_preferences
  # GET /user_benefit_preferences.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @user_benefit_preferences = UserBenefitPreferences.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_benefit_preferences }
    end
  end

  # GET /user_benefit_preferences/1
  # GET /user_benefit_preferences/1.xml
  def show
    @user_benefit_preferences = UserBenefitPreferences.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_benefit_preferences }
    end
  end

  # GET /user_benefit_preferences/new
  # GET /user_benefit_preferences/new.xml
  def new
    @user_benefit_preferences = UserBenefitPreferences.new
    @users = User.find :all
    @benefits = Benefit.find :all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_benefit_preferences }
    end
  end

  # GET /user_benefit_preferences/1/edit
  def edit
    @user_benefit_preferences = UserBenefitPreferences.find(params[:id])
    @users = User.find :all
    @preferences = Preference.find :all
  end

  # POST /user_benefit_preferences
  # POST /user_benefit_preferences.xml
  def create
    @user_benefit_preferences = UserBenefitPreferences.new(params[:user_benefit_preferences])
    @users = User.find :all
    @benefits = Benefit.find :all
    respond_to do |format|
      if @user_benefit_preferences.save
        flash[:notice] = 'UserBenefitPreferences was successfully created.'
        format.html { redirect_to(@user_benefit_preferences) }
        format.xml  { render :xml => @user_benefit_preferences, :status => :created, :location => @user_benefit_preferences }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_benefit_preferences.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_benefit_preferences/1
  # PUT /user_benefit_preferences/1.xml
  def update
    @user_benefit_preferences = UserBenefitPreferences.find(params[:id])

    respond_to do |format|
      if @user_benefit_preferences.update_attributes(params[:user_benefit_preferences])
        flash[:notice] = 'UserBenefitPreferences was successfully updated.'
        format.html { redirect_to(@user_benefit_preferences) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_benefit_preferences.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_benefit_preferences/1
  # DELETE /user_benefit_preferences/1.xml
  def destroy
    @user_benefit_preferences = UserBenefitPreferences.find(params[:id])
    @user_benefit_preferences.destroy

    respond_to do |format|
      format.html { redirect_to(user_benefit_preferences_url) }
      format.xml  { head :ok }
    end
  end
end
