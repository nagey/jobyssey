class JobApplicationStatusType < ActiveRecord::Base
  has_many :job_application_states
end
