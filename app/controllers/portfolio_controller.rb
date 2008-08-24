class PortfolioController < ApplicationController

  before_filter :authenticate_professional
  
  def links
    @attachment = Attachment.new
  end
  
  def add_a_link
    @attachment = Attachment.new params[:attachment]
    @professional = Professional.find session[:user].id
    if @attachment.save
      @professional.attachments << @attachment
      @professional.save
      flash[:message] = "Link saved. please localize me."
      redirect_to :action => :links
    else
      render :action => :links
    end
  end  

end
