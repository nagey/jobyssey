class CodeSampleQuestionController < ApplicationController
  def index
  end

  def explanation
  end
  
  def question
    @code_sample_level = 1 #session[:code_sample_level]
    @user = session[:user]
    #Think this next line is causing users to get logged out
    #session[:user] = @session 
    @code_sample_questions = CodeSampleQuestion.find_all_by_code_sample_level 1
    @code_samples = CodeSample.find_by_user_id
    @start_time = Time.now
    session[:start_time] = @start_time
    unused_question = false
    count = 0
    until (unused_question or count >= @code_sample_questions.length)
        @current_question = @code_sample_questions[rand(@code_sample_questions.length)]
        #cs = CodeSample.find_by_user_id @user
        cs = CodeSample.find_by_code_sample_question_id_and_user_id @current_question.id, @user.id
        unused_question = true if cs.nil?
        count += 1
    end
    if count < @code_sample_questions.length
      session[:current_question] = @current_question
      @code_sample = CodeSample.new
      @code_sample.code_sample_question = @current_question
      @code_sample.user = @user
      render :action => "question"
    else
      redirect_to :action => :view_samples 
    end
  end

  def answer
    @code_sample = CodeSample.new params[:code_sample]
    @end_time = Time.now
     
    
    @code_sample.time_to_answer =  (@end_time - session[:start_time])/60
    
    if @code_sample.save
      redirect_to :action => :index
      flash[:notice]= "It worked!"
    else
      render :action => :index
      flash[:notice]= "It didn't!"
    end
  end

  def view_samples
    @user = session[:user]
    @code_sample_questions = CodeSampleQuestion.find :all
    @code_samples = CodeSample.find_all_by_user_id @user.id
  end

  def view_professional_samples
    @professional = session[:professional]
    @code_sample_questions = CodeSampleQuestion.find :all
    @code_samples = CodeSample.find_all_by_user_id @professional.id
  end

  def view
  end

end