class JobApplicationState < ActiveRecord::Base
  belongs_to :job_application_status_type
  has_many :job_applications, :through => :job_application_status, :conditions => "active = 1"
end
