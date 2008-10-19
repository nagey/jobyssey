class ImagesController < ApplicationController
  
  def upload_image
    @image = Image.new
    
  end
  
  #def upload_image
  #  @image = Image.new params[:image] 
  #  @image = session[:image] if @image.nil?
  #  @employer = session[:user].employer
  #end
  
  def save_image
    @image = Image.new params[:image] 
    @employer = session[:user].employer
    debugger
    if @image.save
      @employer.images << @image
      @employer.save
      redirect_to :controller => "company_profiles", :action => "view"
      flash[:notice] = "Image saved- thanks!"
      return
    else
      redirect_to :controller => "company_profiles", :action => "view"
      flash[:notice] = "Image NOT saved!"
      return
    end
  end
  
  def show
    @image = Image.find params[:id]
    send_data (@image.attachment, :type => @image.content_type,
                         :filename => @image.file_name,
                         :disposition => 'inline')
  end
    
end
