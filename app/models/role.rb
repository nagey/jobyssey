class Role < ActiveRecord::Base
  has_and_belongs_to_many :job_postings
  belongs_to :employer
  has_and_belongs_to_many :users
  has_and_belongs_to_many :transitions
  
  validates_presence_of :name
end
