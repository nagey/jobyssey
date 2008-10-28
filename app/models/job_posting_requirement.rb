class JobPostingRequirement < ActiveRecord::Base
  belongs_to :job_posting
  belongs_to :metric
  validates_uniqueness_of :metric_id, :scope => "job_posting_id", :message => "You've already got one!"
end
