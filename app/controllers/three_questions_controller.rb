class ThreeQuestionsController < ApplicationController
  before_filter :authenticate

  
  def commence
    u = session[:user]
    
    if u.differentiator_answers.length >= 3
      flash[:notice] = "You've already answered your three questions"
      redirect_to :controller => :professionals, :action => :home
      return
    end
    #I'm adding this bit to set to the employer ID for corporate users
    unless u.employer.nil?
      employer_id = session[:user].employer_id
      e = Employer.find_by_id employer_id
      #To check if employers have already answered the questions (need to add edit option for them)
      if e.differentiator_answers.length == 3
        flash[:notice] = "You've already answered your three questions"
        redirect_to :controller => :company_profiles, :action => :edit
        return
      end
      @answers = DifferentiatorAnswer.find_by_employer_id(session[:user].employer_id)
      if @answers == nil
        q = CompanyQuestion.find(:all)
        questions = []
        count = 0
        while (questions.length < 3)
          a = q[rand(q.length)]
          questions << a unless questions.member? a
        end 
        session[:questions] = questions
        redirect_to :action => :ask
      else
        redirect_to :controller => :company_profiles, :action => :edit
      end
    end
    
    #Added the outer if so that only users get this
    if u.employer.nil?
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
        
  end
  
  def ask
    if session[:questions].length > 0
      @answer = DifferentiatorAnswer.new
      @answer.differentiator_question = session[:questions].pop
      #Added this to save w/ employer_id where appropriate
        if session[:user].employer_id.nil?
          @answer.user = session[:user]
        else
          @employer_id = session[:user].employer_id
          @employer = Employer.find_by_id @employer_id
          @answer.employer = @employer
        end
    else
      flash[:notice] = "Thanks for answering our 3 questions."
      if session[:user].employer_id.nil?
        redirect_to :controller => :professionals, :action => :home
      else
        redirect_to :controller => :company_profiles, :action => :edit
      end
    end
   end

   def answer
     @answer = DifferentiatorAnswer.new params[:answer]
     if session[:user].employer_id.nil?
       @answer.user = session[:user]
     else
       @employer_id = session[:user].employer_id
       @employer = Employer.find_by_id @employer_id
       @answer.employer = @employer
     end
     
     if @answer.save
       redirect_to :action => :ask
     else
       render :action => :ask
     end
   end
    
    def edit
     @answers = DifferentiatorAnswers.find_by_user_id(params[:user_id])
    end

    def company_questions
      @employer_id = session[:user].employer_id
      @employer = Employer.find_by_id @employer_id
      q = CompanyQuestion.find(:all)
  
      questions = []
      count = 0
      while (questions.length < 3)
        a = q[rand(q.length)]
        questions << a unless questions.member? a
        session[:questions] = questions
        @answer = DifferentiatorAnswer.new
        @answer.differentiator_question = session[:questions].pop
        @answer.employer_id = @employer_id
       # redirect_to :action => :thanks
      #else
      #  redirect_to :controller => :company_profiles, :action => :edit
      end
    end

def thanks
end

def view_professional_answers
  @professional = session[:professional]
  @answers = DifferentiatorAnswer.find_all_by_user_id session[:professional]
end

def view_employer_answers
  @employer = session[:employer]
  @answers = DifferentiatorAnswer.find_all_by_employer_id session[:employer]
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
