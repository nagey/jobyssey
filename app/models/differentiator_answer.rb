class DifferentiatorAnswer < ActiveRecord::Base
  belongs_to :differentiator_question
  belongs_to :employer
  belongs_to :user
  belongs_to :job_posting
end
