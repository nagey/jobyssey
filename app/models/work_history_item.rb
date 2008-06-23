class WorkHistoryItem < ActiveRecord::Base
  has_and_belongs_to_many :benefits
  belongs_to :user
  belongs_to :job_title
  belongs_to :geo_position
  belongs_to :administrative_division
  belongs_to :town
  belongs_to :country
  belongs_to :employer
  belongs_to :employment_type
  belongs_to :working_time
end
