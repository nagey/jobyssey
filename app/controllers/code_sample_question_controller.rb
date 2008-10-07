class CodeSampleQuestionController < ApplicationController
  def index
  end

  def question
    @code_sample_level = 1 #session[:code_sample_level]
    @user = User.find 1
    session[:user] = @session
    @code_sample_questions = CodeSampleQuestion.find_all_by_code_sample_level 1
    @code_samples = CodeSample.find_by_user_id
    @start_time = Time.now
    session[:start_time] = @start_time
    unused_question = false
    until unused_question
        @current_question = @code_sample_questions[rand(@code_sample_questions.length)]
        #cs = CodeSample.find_by_user_id @user
        cs = CodeSample.find_by_code_sample_question_id_and_user_id @current_question.id, @user.id
        unused_question = true if cs.nil?
    end
    session[:current_question] = @current_question
    @code_sample = CodeSample.new
    @code_sample.code_sample_question = @current_question
    @code_sample.user = @user
    render :action => "question", :layout => "timer"
  end

  def answer
    @code_sample = CodeSample.new params[:code_sample]
    @end_time = Time.now
    
    @code_sample.time_to_answer =  @end_time - session[:start_time]
    
    if @code_sample.save
      redirect_to :action => :index
      flash[:notice]= "It worked!"
    else
      render :action => :index
      flash[:notice]= "It didn't!"
    end
  end

  def view_samples
    @user_id = 1
    @code_sample_questions = CodeSampleQuestion.find :all
    @code_samples = CodeSample.find :all
  end

  def view
  end

end