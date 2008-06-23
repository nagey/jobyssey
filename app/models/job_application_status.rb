class JobApplicationStatus < ActiveRecord::Base
  belongs_to :job_application
  belongs_to :job_applicaton_state
  belongs_to :user
end
