class CompanyProfilesController < ApplicationController
  
  def index
  end
  
  def edit
    @employer = session[:user].employer
  end
  
    
  def save
    @employer = Employer.find_by_id params[:employer][:id]
    @employer.update_attributes params[:employer]
    
    if @employer.save
      redirect_to :action => "view"
      flash[:notice] = "Thanks!  We've saved your changes.  Here's how your profile will look to users."
      return
    else
      flash[:notice] = "Oops!  We were unable to save your changes.  Please try again, or contact us for assistance."
      redirect_to :action => "edit"
      return
    end  
  end
  
  def view
    @employer_id = session[:user].employer_id
    @employer = Employer.find_by_id @employer_id
    @industry = Industry.find_by_id @employer.industry_id
  end
  
  
end
