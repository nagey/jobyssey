class JobPosting < ActiveRecord::Base
  has_and_belongs_to_many :benefits
  has_many :differentiator_answers
  has_many :required_degrees
  belongs_to :working_time
  belongs_to :employment_type
  has_many :job_applications
  belongs_to :employer
  has_and_belongs_to_many :roles
  has_many :educational_levels, :through => :required_degrees
  has_many :education_concentrations, :through => :required_degrees
end
