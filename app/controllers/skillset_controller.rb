class SkillsetController < ApplicationController

  layout 'index'

  def start
    @professional = Professional.find session[:user_id]
    @professional.metrics << @professional.cv.skills
    redirect_to :action => :define if @professional.save
  end

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
    redirect_to :controller => :personality, :action => :define if @p.save
  end
end
