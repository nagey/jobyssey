class PersonalityController < ApplicationController

  before_filter :authenticate


  layout 'index'
  #layout 'signup', :only => [ :start, :define ]

  def begin
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
    redirect_to :controller => :professionals, :action => :home if @trait.nil? #:controller => :invites, :action => :import_addresses if @trait.nil?
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

  def update_value
    pq = PersonalQuality.find params[:personal_quality][:id]
    pq.update_attributes params[:personal_quality]
    #flash[:notice] = "Updated %s" % pq.metric.name if pq.save
    #redirect_to :action => :define
    render :text => flash[:notice]
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
      
  #EDIT PERSONALITY SECTION BEGINS HERE

  def edit
     @personal_quality = PersonalQuality.new
     @professional = session[:user]
     @professional.personal_qualities.each { |p| p.value = 0 if p.value.nil? }
     
     traits = Trait.find(:all)
     for trait in traits
      unless PersonalQuality.exists?(:user_id => @professional.id, :metric_id => trait.id)
        pq = PersonalQuality.new
        pq.user = @professional
        pq.metric = trait
        pq.value = 50
          @professional.personal_qualities << pq
      end
     end
     
     @personal_qualities= @professional.personal_qualities
   end

   def save_edits
     @p = session[:user]
     @p.set_search_position
     redirect_to :controller => :professionals, :action => :home 
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
                  @job_posting_requirement.value = 50 if @job_posting_requirement.value.nil?
               return unless @trait.nil?
              end
              
             #if trait.nil?
                redirect_to :controller => :job, :action => :preview, :id => @job_posting #if @trait.nil? 
                return
              #end
              session[:counter] = 1 if session[:counter].nil?
            end

      def update_job_personality
        @job_posting = session[:job_posting]
        @job_posting_requirement = JobPostingRequirement.new params[:job_posting_requirement]
        @job_posting.job_posting_requirements << @job_posting_requirement
        session[:counter] = 0 if session[:counter].nil?
        session[:counter] += 1
        redirect_to :action => :define_job_personality #if @job_posting.save
      end


#New Employer method

  def job_personality
   @job_posting = JobPosting.find_by_id session[:job_posting] #params[:id]
   

   @job_posting_requirements = []
   traits = Trait.find(:all)
   for trait in traits
      pq = JobPostingRequirement.new
      pq.job_posting = @job_posting
      pq.metric = trait
      pq.value = 50
      pq.save
      @job_posting_requirements << pq
   end
  end

 def save_job_personality
   @p = session[:job_posting]
   @p.set_search_position
   redirect_to :controller => :job, :action => :preview, :id => @job_posting 
 end
 
end