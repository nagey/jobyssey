class EducationConcentration < ActiveRecord::Base
  has_many :users, :through => :degrees
  has_many :job_postings, :through => :required_degrees
end
