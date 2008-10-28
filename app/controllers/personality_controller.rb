class PersonalityController < ApplicationController

  before_filter :authenticate


  #layout 'index'
  #layout 'signup', :only => [ :start, :define ]

  def start
    session[:counter] = 1
    redirect_to :action => :define, :layout => 'signup'
  end

  def define
   
    @professional = session[:user]
    @trait = nil
    @personal_quality = PersonalQuality.new
    traits = Trait.find(:all)
    @total = traits.length
    traits.each do |t|
      @trait = t unless @professional.traits.member? t
      @personal_quality.metric = @trait
      break unless @trait.nil?
    end
    @personal_quality.value = 50 if @personal_quality.value.nil?
    redirect_to :controller => :invites, :action => :import_addresses if @trait.nil?
    flash[:notice] = 'Welcome to Jobyssey!' if @trait.nil?
    session[:counter] = 1 if session[:counter].nil?
  end
  
  def update
    @professional = session[:user]
    @personal_quality = PersonalQuality.new params[:personal_quality]
    @professional.personal_qualities << @personal_quality
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
    redirect_to :action => :define if @professional.save
  end

  def details
    @professional_id = Professional.find_by_id 1 #session[:professional]
    @personal_qualities = PersonalQuality.find_by_user_id @professional_id
    for each in @personal_qualities
      if value < 25 
        valuename = "Strongly" + personal_quality.metric.lower_bound
        return
      elsif value < 45
        valuename = "Somewhat" + personal_quality.metric.lower_bound
        return
      elsif value < 55
        valuename = "No strong preference"
        return
      elsif value < 75
        valuename = "Somewhat" + personal_quality.metric.upper_bound
        return
      else  
        valuename = "Strongly" + personal_quality.metric.upper_bound
        return      
      end
    end
  end
      
#Employer stuff from here down
      
      def start_job_personality
        session[:counter] = 1
        redirect_to :action => :define_job_personality
      end

      def define_job_personality

        @job_posting = session[:job_posting]
        @trait = nil
        @job_posting_requirement = JobPostingRequirement.new
        traits = Trait.find(:all)
        @total = traits.length
        traits.each do |t|
          @trait = t unless @job_posting.traits.member? t
          @job_posting_requirement.metric = @trait
          break unless @trait.nil?
        end
        @job_posting_requirement.value = 50 if @job_posting_requirement.value.nil?
        redirect_to :controller => :job, :action => :view if @trait.nil?
        #flash[:notice] = 'Welcome to Jobyssey!' if @trait.nil?
        session[:counter] = 1 if session[:counter].nil?
      end

      def update_job_personality
        @job_posting = session[:job_posting]
        @job_posting_requirement = JobPostingRequirement.new params[:job_posting_requirement]
        @job_posting.job_posting_requirements << @job_posting_requirement
        session[:counter] = 0 if session[:counter].nil?
        session[:counter] += 1
        redirect_to :action => :define_job_personality #if @job_posting.save
        debugger
      end

      #def details
      #  @professional_id = Professional.find_by_id 1 #session[:professional]
      #  @personal_qualities = PersonalQuality.find_by_user_id @professional_id
      #  for each in @personal_qualities
      #    if value < 25 
      #      valuename = "Strongly" + personal_quality.metric.lower_bound
      #      return
      #    elsif value < 45
      #      valuename = "Somewhat" + personal_quality.metric.lower_bound
      #      return
      #    elsif value < 55
      #      valuename = "No strong preference"
      #      return
      #    elsif value < 75
      #      valuename = "Somewhat" + personal_quality.metric.upper_bound
      #      return
      #    else  
      #      valuename = "Strongly" + personal_quality.metric.upper_bound
      #      return      
      #    end
      #  end
      #end
      
end