class CompanyProfilesController < ApplicationController
  
  layout 'googlemaps'
  
  before_filter :authenticate
  
  def index
  end
  
  def edit
    @user = session[:user]
    @employer = Employer.find_by_id session[:user].employer
  end
  
    
  def save
    @employer = Employer.find_by_id params[:employer][:id]
    @employer.update_attributes params[:employer]

      redirect_to :action => "preview", :id => @employer
      flash[:notice] = "Thanks!  We've saved your changes.  Here's how your profile will look to users."
      return
    #else
    #  flash[:notice] = "Oops!  We were unable to save your changes.  Please try again, or contact us for assistance."
   #   redirect_to :action => "edit"
    #  return
  #  end  
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
    @answers = DifferentiatorAnswer.find_all_by_employer_id @employer_id 
    address = @employer.addresses.first
    @address = @employer.addresses.first
    begin
      @map = init_map address
    rescue
      address = Address.new
      address.town = Town.find_by_name 'Dublin 2'
      @map = init_map address
    end
  end
  
  def preview
    @employer_id = Employer.find(params[:id])
   
    @employer = Employer.find_by_id @employer_id
    @industry = Industry.find_by_id @employer.industry_id
    @answers = DifferentiatorAnswer.find_all_by_employer_id @employer_id 
    address = @employer.addresses.first
    @address = @employer.addresses.first
    begin
      @map = init_map address
    rescue
      address = Address.new
      address.town = Town.find_by_name 'Dublin 2'
      @map = init_map address
    end
  end
  
  def remove_image_from_profile
    e = session[:user].employer
    image = Image.find params[:id]
    if e.images.member? image
      image.destroy
      flash[:notice] = "Image removed"
    else
      flash[:notice] = "Couldn't find the image you were looking for"
    end
    redirect_to :action => "edit"
  end
  
end
