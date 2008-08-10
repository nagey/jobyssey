class PersonalQuestionsController < ApplicationController

  layout 'index'

  # GET /personal_questions
  # GET /personal_questions.xml
  def index
    @personal_questions = PersonalQuestion.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @personal_questions }
    end
  end

  # GET /personal_questions/1
  # GET /personal_questions/1.xml
  def show
    @personal_question = PersonalQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @personal_question }
    end
  end

  # GET /personal_questions/new
  # GET /personal_questions/new.xml
  def new
    @personal_question = PersonalQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @personal_question }
    end
  end

  # GET /personal_questions/1/edit
  def edit
    @personal_question = PersonalQuestion.find(params[:id])
  end

  # POST /personal_questions
  # POST /personal_questions.xml
  def create
    @personal_question = PersonalQuestion.new(params[:personal_question])

    respond_to do |format|
      if @personal_question.save
        flash[:notice] = 'PersonalQuestion was successfully created.'
        format.html { redirect_to(@personal_question) }
        format.xml  { render :xml => @personal_question, :status => :created, :location => @personal_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @personal_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personal_questions/1
  # PUT /personal_questions/1.xml
  def update
    @personal_question = PersonalQuestion.find(params[:id])

    respond_to do |format|
      if @personal_question.update_attributes(params[:personal_question])
        flash[:notice] = 'PersonalQuestion was successfully updated.'
        format.html { redirect_to(@personal_question) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @personal_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_questions/1
  # DELETE /personal_questions/1.xml
  def destroy
    @personal_question = PersonalQuestion.find(params[:id])
    @personal_question.destroy

    respond_to do |format|
      format.html { redirect_to(personal_questions_url) }
      format.xml  { head :ok }
    end
  end
end
