class SkillsController < ApplicationController

  layout 'index'

  def define
    @skill = Skill.new
    @professional = Professional.find session[:user_id]
  end
  
  def autocomplete_name
    @skills = Skills.find :all
    render :layout => :false
  end

  def add
    skills = Skill.find_all_by_display_name(params[:skill][:name])
    if skills.length == 1
      @skill = skills.first
    elsif skills.length == 0
      @skill = Skill.new params[:skill]
    end
    @user = User.find session[:user_id]
    begin
      @user.metrics << @skill
      unless @user.save
        flash[:notice] = l(:skills, :couldnt_add_skill)
      end
    rescue 
      flash[:notice] = l(:skills, :skill_taken)
    end
    redirect_to :action => :define
  end
  
  def update_value
    pq = PersonalQuality.find params[:pq][:id]
    pq.update_attributes params[:pq]
    flash[:notice] = "Updated %s" % pq.metric.name if pq.save
    redirect_to :action => :define
  end
  
  def finalize
    @p = Professional.find session[:user_id]
    @p.set_search_position
    redirect_to :controller => :traits, :action => :define if @p.save
  end
  
  
  # GET /skills
  # GET /skills.xml
  def index
    @skills = Skill.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skills }
    end
  end

  # GET /skills/1
  # GET /skills/1.xml
  def show
    @skill = Skill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @skill }
    end
  end

  # GET /skills/new
  # GET /skills/new.xml
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.xml
  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        flash[:notice] = 'Skill was successfully created.'
        format.html { redirect_to(@skill) }
        format.xml  { render :xml => @skill, :status => :created, :location => @skill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.xml
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        flash[:notice] = 'Skill was successfully updated.'
        format.html { redirect_to(@skill) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.xml
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to(skills_url) }
      format.xml  { head :ok }
    end
  end
  
end
