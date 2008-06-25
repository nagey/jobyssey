class FeedbackItem < ActiveRecord::Base
  belongs_to :job_application
  belongs_to :user
end
