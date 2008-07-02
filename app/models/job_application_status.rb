class JobApplicationStatus < ActiveRecord::Base
  belongs_to :job_application
  belongs_to :job_application_state
  belongs_to :user
end
