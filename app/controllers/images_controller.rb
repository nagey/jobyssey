class ImagesController < ApplicationController
  
  before_filter :authenticate
  
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
    @employer = Employer.find_by_id session[:employer]
    if @image.save
      @employer.images << @image
      @employer.save
      redirect_to :controller => "company_profiles", :action => "edit", :id => @employer
      flash[:notice] = "Image saved- thanks!"
      return
    else
      redirect_to :controller => "company_profiles", :action => "edit", :id => @employer
      flash[:notice] = "We we unable to save that image.  Please check that you hae a JPG, GIF or PNG and try again, or contact us for assistance."
      return
    end
  end
  
  def show
    @image = Image.find params[:id]
    send_data(@image.attachment, :type => @image.content_type,
                         :filename => @image.file_name,
                         :disposition => 'inline')
  end
     
    def destroy
      @image = Image.find params[:id]
      @image.destroy
      flash[:notice] = 'Image deleted'
      redirect_to :controller => :company_profiles, :action => :edit 
    end
end
