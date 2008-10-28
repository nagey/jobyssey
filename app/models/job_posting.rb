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
  
end
