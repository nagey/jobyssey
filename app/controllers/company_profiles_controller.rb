class CompanyProfilesController < ApplicationController
  
  layout 'googlemaps'
  
  def index
  end
  
  def edit
    @employer = Employer.find_by_id 1 #session[:user].employer
  end
  
    
  def save
    @employer = Employer.find_by_id params[:employer][:id]
    @employer.update_attributes params[:employer]
    
    if @employer.save
      redirect_to :action => "view", :id => @employer
      flash[:notice] = "Thanks!  We've saved your changes.  Here's how your profile will look to users."
      return
    else
      flash[:notice] = "Oops!  We were unable to save your changes.  Please try again, or contact us for assistance."
      redirect_to :action => "edit"
      return
    end  
  end
  
  def view
    @employer_id = Employer.find(params[:id])
    #if session[:user].employer_id != nil
    #  @employer_id = session[:user].employer_id 
    #else 
    #  @employer_id = session[:employer]
    #end
    @employer = Employer.find_by_id @employer_id
    @industry = Industry.find_by_id @employer.industry_id
    @answers = DifferentiatorAnswer.find(:all) #_by_employer_id @employer_id
    @map = init_map @employer.addresses.first 
  end
  
end
