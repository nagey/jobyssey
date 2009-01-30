class AdministrationController < ApplicationController
  
    before_filter :authorize_admin
  
  def view_all_professionals
    @professionals = Professional.find :all
  end
  
  def edit_professional
    @professional = Professional.find_by_id params[:id]
  end
  
  def save_changed_professional
    professional = Professional.find params[:id]
    professional.update_attributes params[:professional] 
    professional.set_password(params[:professional][:password])
    if professional.save
      redirect_to :action => :view_all_professionals
      flash[:notice] = "Changes saved."
    else
      @professional = professional
      render :action => :edit_professional
    end
  end
  
  def change_cv
    @cv = Cv.new
    @cv.entity = User.find params[:id]
    @user = User.find params[:id]
  end
  
  def save_changed_cv
    user = Professional.find_by_id params[:cv][:id]
    cv = Cv.find_by_entity_id params[:cv][:id]
    cv.destroy unless cv.nil?
    new_cv = Cv.new params[:cv]
    user.cv = new_cv
    if user.cv.save
      flash[:notice]= "It worked!"
      redirect_to :action => :view_all_professionals 
    else
      flash[:notice] = "It didn't!"
    end
  end
  
  def view_all_employers
    @employers = Employer.find :all
  end
  
  
  def upgrade_employer
    @employer = Employer.find_by_id params[:id]
  end
  
  def save_upgrade
     employer = Employer.find_by_id params[:administration][:id]
     employer.update_attribute(:premium, true)
     redirect_to :action => :view_all_employers
     if employer.premium?
       flash[:notice] = "Account Upgraded."
      else
        flash[:notice] = "Didn't work."
      end
  end
  
  def home
  end
end
