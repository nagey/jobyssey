class Benefit < ActiveRecord::Base
  has_and_belongs_to_many :job_postings
  has_many :users, :through => :user_benefit_preferences
end
