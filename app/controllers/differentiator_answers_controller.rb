class DifferentiatorAnswersController < ApplicationController
  # GET /differentiator_answers
  # GET /differentiator_answers.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @differentiator_answers = DifferentiatorAnswer.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @differentiator_answers }
    end
  end

  # GET /differentiator_answers/1
  # GET /differentiator_answers/1.xml
  def show
    @differentiator_answer = DifferentiatorAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @differentiator_answer }
    end
  end

  # GET /differentiator_answers/new
  # GET /differentiator_answers/new.xml
  def new
    @differentiator_answer = DifferentiatorAnswer.new
    @differentiator_questions = DifferentiatorQuestion.find :all
    @employers = Employer.find :all
    @users = User.find :all
    @job_postings = JobPosting.find :all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @differentiator_answer }
    end
  end

  # GET /differentiator_answers/1/edit
  def edit
    @differentiator_answer = DifferentiatorAnswer.find(params[:id])
    @differentiator_questions = DifferentiatorQuestion.find :all
    @employers = Employer.find :all
    @users = User.find :all
    @job_postings = JobPosting.find :all
  end

  # POST /differentiator_answers
  # POST /differentiator_answers.xml
  def create
    @differentiator_answer = DifferentiatorAnswer.new(params[:differentiator_answer])
    @differentiator_questions = DifferentiatorQuestion.find :all
    @employers = Employer.find :all
    @users = User.find :all
    @job_postings = JobPosting.find :all
    respond_to do |format|
      if @differentiator_answer.save
        flash[:notice] = 'DifferentiatorAnswer was successfully created.'
        format.html { redirect_to(@differentiator_answer) }
        format.xml  { render :xml => @differentiator_answer, :status => :created, :location => @differentiator_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @differentiator_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /differentiator_answers/1
  # PUT /differentiator_answers/1.xml
  def update
    @differentiator_answer = DifferentiatorAnswer.find(params[:id])

    respond_to do |format|
      if @differentiator_answer.update_attributes(params[:differentiator_answer])
        flash[:notice] = 'DifferentiatorAnswer was successfully updated.'
        format.html { redirect_to(@differentiator_answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @differentiator_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /differentiator_answers/1
  # DELETE /differentiator_answers/1.xml
  def destroy
    @differentiator_answer = DifferentiatorAnswer.find(params[:id])
    @differentiator_answer.destroy

    respond_to do |format|
      format.html { redirect_to(differentiator_answers_url) }
      format.xml  { head :ok }
    end
  end
end
