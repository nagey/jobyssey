class Qualification < ActiveRecord::Base
  belongs_to :job_posting
  belongs_to :metric
  validates_uniqueness_of :metric_id, :scope => "user_id"
end
