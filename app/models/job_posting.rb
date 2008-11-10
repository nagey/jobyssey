class JobPosting < ActiveRecord::Base
  has_and_belongs_to_many :benefits
  has_many :differentiator_answers
  has_many :required_degrees
  belongs_to :working_time
  belongs_to :employment_type
  has_many :job_applications
  has_many :metrics, :through => :job_posting_requirements
  has_many :job_posting_requirements  
  belongs_to :employer
  has_and_belongs_to_many :roles
  has_many :educational_levels, :through => :required_degrees
  has_many :education_concentrations, :through => :required_degrees
  has_many :attachments, :as => :entity
  has_one :job_specs, :as => :entity

  
  validates_presence_of :title
  validates_numericality_of :minimum_salary
  validates_numericality_of :maximum_salary
  
  def set_search_position
  end
  
  def traits
    metrics.collect {|x| x unless x.class != Trait}.delete_if { |x| x.nil? }
  end
  
  def metric
  end
  
  def my_skills
    job_posting_requirements.collect { |x| x unless x.metric.class != Skill }.compact
  end
  
  def my_traits
    job_posting_requirements.collect { |x| x unless x.metric.class != Trait }.compact    
  end
  
   def best_skills
     if my_skills.nil?
       return
     else
       my_skills.sort_by { |pq| pq.value }.reverse.delete_if { |pq| pq.value == 0 }
     end
   end
   
   def name_trait
        if value < 30
           return metric.lower_bound + "<br>"
        elsif value > 70
           return metric.upper_bound + "<br>"
        else  
         return    
        end
    end
   
end

