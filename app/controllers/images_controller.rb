class ImagesController < ApplicationController
  
  def index
    @image = Image.new
    
  end
  
  def upload
    @image = Image.new params[:image] 
    @image = session[:image] if @image.nil?
    @employer = session[:user].employer
    t.integer :entity_id
    t.string :entity_type
    t.string :name
    t.string :url
    t.text :description
    t.binary :attachment
    t.string :file_name
    t.string :content_type
    t.string :type
    if @image.save
      render :action => "signup", :layout => "signup" 
    else
      render :action => :index, :layout => "signup" unless @cv.valid? 
    end

  end
  
end
