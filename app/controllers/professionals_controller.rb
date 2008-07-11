class ProfessionalsController < ApplicationController

  layout 'index'
  
  def index
    @professional = Professional.new
  end
  
  def signup
    @professional = Professional.new params[:professional]
    session[:professional] = @professional
    render :action => :index unless @professional.valid?
  end

  def create
    @professional = session[:professional]
    @professional.update_attributes params[:professional]
    if @professional.save
      session[:user_id] = @professional.id
      session[:professional] = nil
      redirect_to :controller => :skills, :action => :define
    else
      render :action => :signup
    end
  end
  
end
