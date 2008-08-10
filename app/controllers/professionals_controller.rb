class ProfessionalsController < ApplicationController
 
  layout 'index'
  
  def index
    @cv = Cv.new
  end
  
  def signup
    @cv = Cv.new params[:cv]
    @professional = Professional.new
    @employment_types = EmploymentType.find :all
    @working_times = WorkingTime.find :all
    session[:cv] = @cv
    render :action => :index unless @cv.valid?
  end
 
  def create
    @professional = Professional.new
    @professional.cv = session[:cv]
    @professional.update_attributes params[:professional]
    if @professional.save
      session[:user_id] = @professional.id
      session[:professional] = nil
      redirect_to :controller => :skillset, :action => :start
    else
      render :action => :signup
    end
  end
  
  def home
    @home
  end
end
