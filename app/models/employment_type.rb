class EmploymentType < ActiveRecord::Base
  has_many :job_postings
  has_many :work_history_items
end
