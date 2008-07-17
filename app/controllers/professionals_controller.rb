class ProfessionalsController < ApplicationController

  layout 'index'
  
  def index
<<<<<<< HEAD:app/controllers/professionals_controller.rb
=======
    @cv = Cv.new
  end
  
  def signup
    @cv = Cv.new params[:cv]
    @professional = Professional.new
    session[:cv] = @cv
    render :action => :index unless @cv.valid?
>>>>>>> c0965a58b5dee903c5648133067d90e370de9c0c:app/controllers/professionals_controller.rb
  end

<<<<<<< HEAD:app/controllers/professionals_controller.rb
=======
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
  
>>>>>>> c0965a58b5dee903c5648133067d90e370de9c0c:app/controllers/professionals_controller.rb
end
