class DifferentiatorQuestionsController < ApplicationController
  # GET /differentiator_questions
  # GET /differentiator_questions.xml
  
   layout 'index'
   before_filter :authorize_admin
  
  def index
    @differentiator_questions = DifferentiatorQuestion.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @differentiator_questions }
    end
  end

  # GET /differentiator_questions/1
  # GET /differentiator_questions/1.xml
  def show
    @differentiator_question = DifferentiatorQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @differentiator_question }
    end
  end

  # GET /differentiator_questions/new
  # GET /differentiator_questions/new.xml
  def new
    @differentiator_question = DifferentiatorQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @differentiator_question }
    end
  end

  # GET /differentiator_questions/1/edit
  def edit
    @differentiator_question = DifferentiatorQuestion.find(params[:id])
  end

  # POST /differentiator_questions
  # POST /differentiator_questions.xml
  def create
    @differentiator_question = DifferentiatorQuestion.new(params[:differentiator_question])
    @differentiator_question.type = params[:differentiator_question][:type]
    respond_to do |format|
      if @differentiator_question.save
        flash[:notice] = 'DifferentiatorQuestion was successfully created.'
        format.html { redirect_to(@differentiator_question) }
        format.xml  { render :xml => @differentiator_question, :status => :created, :location => @differentiator_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @differentiator_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /differentiator_questions/1
  # PUT /differentiator_questions/1.xml
  def update
    @differentiator_question = DifferentiatorQuestion.find(params[:id])

    respond_to do |format|
      if @differentiator_question.update_attributes(params[:differentiator_question])
        @differentiator_question.type = params[:differentiator_question][:type]
        flash[:notice] = 'DifferentiatorQuestion was successfully updated.'
        format.html { redirect_to(@differentiator_question) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @differentiator_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /differentiator_questions/1
  # DELETE /differentiator_questions/1.xml
  def destroy
    @differentiator_question = DifferentiatorQuestion.find(params[:id])
    @differentiator_question.destroy

    respond_to do |format|
      format.html { redirect_to(differentiator_questions_url) }
      format.xml  { head :ok }
    end
  end
end
