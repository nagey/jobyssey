class ProfessionalsController < ApplicationController
 
  layout 'index', :except => :signup 

  before_filter :authenticate, :only => :home

  def index
    @cv = Cv.new
    
  end
  
  def signup
    
    #@cv = Cv.new params[:cv] 
    #@cv = session[:cv] if @cv.nil?
    @professional = Professional.new
    @employment_types = EmploymentType.find :all
    @working_times = WorkingTime.find :all
    
    if @cv.nil?
      flash[:notice] = 'Please attach your CV to continue.'
      #render :action => "index", :controller => "jobyssey", :layout => "index"
      redirect_to "index.html"
      return
    else
      @cv = Cv.new params[:cv] 
    end
    
    session[:cv] = @cv
    render :action => :index #unless @cv.valid? 
    code_name = false
    p = Preposition.find :all
    v = Verb.find :all
    n = Noun.find :all
    while !code_name
      @code_name = v[rand(v.length)].verb + ' ' + p[rand(p.length)].preposition + ' ' + n[rand(n.length)].noun
      uu = User.find_by_code_name @code_name
      code_name = true if uu.nil?
    end
    session[:code_name] = @code_name
    render :action => "signup", :layout => "signup"

  end
 
  def create
    @professional = Professional.new
    @working_times = WorkingTime
    @professional.cv = session[:cv]
    @professional.update_attributes params[:professional]
    @professional.code_name = session[:code_name]
    
    if params[:tsandcs].to_i != 1
      @professional.errors.add l(:tsandcs)
      @employment_types = EmploymentType.find :all
      @working_times = WorkingTime.find :all
      render :action => :signup
      return
    end
    if @professional.save
      session[:user_id] = @professional.id
      session[:user] = @professional
      session[:professional] = nil
      redirect_to :controller => :skillset, :action => :start
    else
      @employment_types = EmploymentType.find :all
      @working_times = WorkingTime.find :all
      render :action => :signup
      return
    end
  end
  
  def home
    @home
  end



end

