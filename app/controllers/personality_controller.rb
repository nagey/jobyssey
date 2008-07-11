class PersonalityController < ApplicationController

  layout 'index'

  def define
    @professional = Professional.find session[:user_id]
    @trait = nil
    @personal_quality = PersonalQuality.new
    Trait.find(:all).each do |t|
      @trait = t unless @professional.traits.member? t
      @personal_quality.metric = @trait
      break unless @trait.nil?
    end
    redirect_to :controller => :job_postings, :action => :find if @trait.nil?
  end
  
  def update
    @professional = Professional.find session[:user_id]
    @personal_quality = PersonalQuality.new params[:personal_quality]
    @professional.personal_qualities << @personal_quality
    redirect_to :action => :define if @professional.save
  end

end
