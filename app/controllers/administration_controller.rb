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
end
