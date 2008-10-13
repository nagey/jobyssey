class SkillsetController < ApplicationController

  layout 'index'
  layout 'signup', :only => [ :define, :create ]
  before_filter :authenticate
  auto_complete_for :skill, :name

  def start
    @professional = session[:user]
    @professional.metrics << @professional.cv.skills
    redirect_to :action => :define if @professional.save!
  end

  def define
   
    @skill = Skill.new
    @professional = session[:user]
    @professional.personal_qualities.each { |p| p.value = 0 if p.value.nil? }
  end
  
  def autocomplete_name
    @skills = Skills.find :all
    render :layout => :false
  end

  def add
    skills = Skill.find_all_by_name(params[:skill][:name].downcase)
    if skills.length == 1
      @skill = skills.first
    elsif skills.length == 0
      @skill = Skill.new params[:skill]
    end
    @user = session[:user]
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
    pq = PersonalQuality.find params[params[:object_name].to_sym][:id]
    pq.update_attributes params[params[:object_name].to_sym]
    #flash[:notice] = "Updated %s" % pq.metric.name if pq.save    
    #redirect_to :action => :define
    render :text => flash[:notice]
  end
  
  def finalize
    @p = session[:user]
    @p.set_search_position
    redirect_to :controller => :personality, :layout => 'signup', :action => :start if @p.save
  end
  
  def destroy
     pq = PersonalQuality.find_by_metric_id params[:id]
     pq.destroy
     render :text => 'foo'
  end
  
end
