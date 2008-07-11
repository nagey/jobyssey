class EducationalLevel < ActiveRecord::Base
  has_many :educational_qualifications
  has_many :degrees
  has_many :educational_levels 
  has_many :users, :through => :degrees
  has_many :job_postings, :through => :required_degrees
end
