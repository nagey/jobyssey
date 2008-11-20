class PortfolioController < ApplicationController

  before_filter :authenticate_professional
  
  def links
    @attachment = Attachment.new
    @user = session[:user] 
  end
  
  def add_a_link
    @attachment = Attachment.new params[:attachment]
    @professional = Professional.find session[:user].id
    if @attachment.save
      @professional.attachments << @attachment
      #@professional.save
      flash[:message] = l(:link_saved)
      redirect_to :action => :links
    else
      render :action => :links
    end
  end  

  def view_links
    @user = session[:user] 
  end  
 
  def attachment
    @attachment
  end
 
  def edit
    @attachment = Attachment.find(params[:id])
  end

  def update
    @attachment = Attachment.find params[:id]
    @attachment.update_attributes params[:attachment]
    if true
      flash[:notice] = 'Thanks! Your portfolio has been updated.'
      redirect_to :action => :links
    else
      flash[:notice] = 'Unable to update- please try again.'
      redirect_to :action => :links
    end
  end

  def destroy
    @attachment = Attachment.find params[:id]
    @attachment.destroy
    flash[:notice] = 'all gone!'
    redirect_to :action => :links
  end

  def view_professional_portfolio
    @professional = session[:professional]
    @attachments = Attachment.find @professional
  end
end
