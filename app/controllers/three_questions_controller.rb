class ThreeQuestionsController < ApplicationController
  before_filter :authenticate
  
  def start
    q = PersonalQuestion.find(:all)
    questions = []
    count = 0
    while (questions.length < 3)
      a = q[rand(q.length)]
      questions << a unless questions.member? a
    end 
    session[:questions] = questions
    redirect_to :action => :ask
  end
  
  def ask
    if session[:questions].length > 0
      @answer = DifferentiatorAnswer.new
      @answer.differentiator_question = session[:questions].pop
      @answer.user = session[:user]
    else
      flash[:message] = "Thanks for answering our 3 questions. Richard should add me to localization"
      redirect_to :controller => :professionals, :action => :home
    end
   end

   def answer
     @answer = DifferentiatorAnswer.new params[:answer]
     if @answer.save
       redirect_to :action => :ask
     else
       render :action => :ask
     end
   end
    
end
