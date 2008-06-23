class Transition < ActiveRecord::Base
  belongs_to :current_state, :class_name => "JobApplicationState"
  belongs_to :next_state, :class_name => "JobApplicationState"
  belongs_to :workflow
  has_and_belongs_to_many :roles
end
