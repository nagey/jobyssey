class CodeSampleQuestionController < ApplicationController
  def index
  end

  def question
    @code_sample_level = 1 #session[:code_sample_level]
    #@user = session[:user]
    @user_id = 1
    @code_sample_questions = CodeSampleQuestion.find_all_by_code_sample_level 1
    @code_samples = CodeSample.find_by_user_id
    
    used_question = false
      while !used_question
        @current_question = @code_sample_questions[rand(@code_sample_questions.length)]
        #cs = CodeSample.find_by_user_id @user
        cs = CodeSample.find_by_code_sample_question_id_and_user_id @code_sample_question.id, @user.id unless @user.nil? or unless @code_sample_question.nil?
        used_question = true if cs.nil?
      end
    session[:current_question] = @current_question
    render :action => "question"
  end

def answer
    @code_sample = CodeSample.new params[:code_sample]
   
    if @code_sample.save
      session[:user_id] = @code_sample.user_id
      session[:code_sample_question_id] = @code_sample.code_sample_question_id
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
  @code_samples = CodeSample.find :all
end

def view
end

end