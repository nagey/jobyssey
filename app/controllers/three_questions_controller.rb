class ThreeQuestionsController < ApplicationController
  before_filter :authenticate
  
  def start
    u = User.find session[:user]
    if u.differentiator_answers.length == 3
      flash[:notice] = "You've already answered your three questions"
      redirect_to :controller => :professionals, :action => :home
      return
    end
    @answers = DifferentiatorAnswer.find_by_user_id(session[:user])
    if @answers == nil
      q = PersonalQuestion.find(:all)
      questions = []
      count = 0
      while (questions.length < 3)
        a = q[rand(q.length)]
        questions << a unless questions.member? a
      end 
      session[:questions] = questions
      redirect_to :action => :ask
    else
      redirect_to :controller => :professionals, :action => :edit
    end
  end
  
  def ask
    if session[:questions].length > 0
      @answer = DifferentiatorAnswer.new
      @answer.differentiator_question = session[:questions].pop
      @answer.user = session[:user]
    else
      flash[:notice] = "Thanks for answering our 3 questions."
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
    
    def edit
     @answers = DifferentiatorAnswers.find_by_user_id(params[:user_id])
    end
    
    #def update
    #  @answers = DifferentiatorAnswers.find(params[:user_id])
    #  @answers.update_attributes params[:attachment]
    #  if true
    #    flash[:notice] = 'Thanks! Your portfolio has been updated.'
    #    redirect_to :action => :links
    #  else
    #    flash[:notice] = 'Unable to update- please try again.'
    #    redirect_to :action => :links
    #  end
    #end
end
