class JobApplication < ActiveRecord::Base
  belongs_to :user, :class_name => "Professional"
  belongs_to :job_posting
  has_many :job_application_statuses, :order => "created_at DESC"
  has_one :current_status, :class_name => "JobApplicationStatus", :conditions => "active = 1"
  has_many :job_application_attachments
  has_many :transactions
  has_many :transitions
  has_one :feedback_item
  has_many :job_postings
  has_one :employer, :through => :job_postings
  
  def status
    nil
    job_application_statuses.last.job_application_state.name unless job_application_statuses.empty?
  end
  
end
