class SkillsetController < ApplicationController
 
  #layout 'index'
  #layout 'signup', :only => [ :define, :create ]
  before_filter :authenticate
  auto_complete_for :skill, :name
 
  def foo
  end
 
  def begin
    @professional = session[:user]
    @professional.metrics << @professional.cv.skills
    redirect_to :action => :define if @professional.save!
  end
 
  def define
    @skill = Skill.new
    @professional = session[:user]
    @professional.personal_qualities.each { |p| p.value = 0 if p.value.nil? }
  end
  
  #def autocomplete_name
  #def autocomplete_for_skills_name
  #  @skills = Skills.find :all
  #  render :layout => :false
  #end
 
  def add
    skills = Skill.find_all_by_name(params[:skill][:name].downcase)
    if skills.length == 1
      skill = skills.first
    elsif skills.length == 0
      skill = Skill.new params[:skill]
    end
    user = session[:user]
    begin
      user.metrics << skill
      unless user.save
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
    p = session[:user]
    p.set_search_position
    redirect_to :controller => :personality, :action => :begin if @p.save
  end
  
  def destroy
     pq = PersonalQuality.find_by_metric_id params[:id]
     pq.destroy
     render :text => 'foo'
  end
  
  #def view_skill
  #  @professional = Professional.find_by_id 1 #session[:professional]
  #      @skills = Skill.find(session[:user_id])
  #end
  
#EDIT SKILLS SECTION BEGINS HERE

def edit
   @skill = Skill.new
   @professional = session[:user]
   @professional.personal_qualities.each { |p| p.value = 0 if p.value.nil? }
 end
 
# def autocomplete_name
#   @skills = Skills.find :all
#   render :layout => :false
# end

 def edit_add
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
   redirect_to :action => :edit
end
 
# def update_value
#   pq = PersonalQuality.find params[params[:object_name].to_sym][:id]
#   pq.update_attributes params[params[:object_name].to_sym]
#   #flash[:notice] = "Updated %s" % pq.metric.name if pq.save
   #redirect_to :action => :define
#   render :text => flash[:notice]
# end
 
 def save_edits
   @p = session[:user]
   @p.set_search_position
   redirect_to :controller => :professionals, :action => :home 
 end
 
# def destroy
#    pq = PersonalQuality.find_by_metric_id params[:id]
#    pq.destroy
#    render :text => 'foo'
# end
 
#JOB POSTING SECTION BEGINS HERE
 
 def start_job_posting_skills
    @job_posting = JobPosting.find_by_id params[:id]
    session[:job_posting] = @job_posting
    @job_posting.metrics << @job_posting.job_specs.skills unless @job_posting.job_specs.nil?
    redirect_to :action => :define_job_posting_skills
  end
 
  def define_job_posting_skills
   
    @skill = Skill.new
    @job_posting = session[:job_posting]
    @job_posting.job_posting_requirements.each { |p| p.value = 0 if p.value.nil? }
  end
 
  def add_job_posting_skills
    skills = Skill.find_all_by_name(params[:skill][:name].downcase)
    if skills.length == 1
      @skill = skills.first
    elsif skills.length == 0
      @skill = Skill.new params[:skill]
    end
    @job_posting = session[:job_posting]
    begin
      @job_posting.metrics << @skill
      unless @job_posting.save
        flash[:notice] = l(:skills, :couldnt_add_skill)
      end
    rescue
      flash[:notice] = l(:skills, :skill_taken)
    end
    redirect_to :action => :define_job_posting_skills
  end
  
  def update_value_job_posting_skills
    pq = JobPostingRequirement.find params[params[:object_name].to_sym][:id]
    pq.update_attributes params[params[:object_name].to_sym]
    flash[:notice] = "Updated %s" % pq.metric.name if pq.save
    #redirect_to :action => :define_job_posting_skills
    render :text => flash[:notice]
  end
  
  def finalize_job_posting_skills
    @jp = session[:job_posting]
    @jp.set_search_position
    redirect_to :controller => :personality, :action => :start_job_personality, :id => @jp if @jp.save
  end
  
  def view_skill_job_posting_skills
    @job_posting = JobPosting.find_by_id 1 #session[:professional]
    @skills = Skill.find(session[:job_posting])
  end
end