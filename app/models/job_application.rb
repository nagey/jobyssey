class JobApplication < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :job_posting_id
  has_many :job_application_statuses, :order => "created_at DESC"
  has_one :current_status, :class_name => "JobApplicationStatus", :conditions => "active = 1"
  has_many :job_application_attachments
  has_many :transactions
  has_many :transitions
end
