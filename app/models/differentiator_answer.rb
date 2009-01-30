class DifferentiatorAnswer < ActiveRecord::Base
  belongs_to :differentiator_question
  belongs_to :employer
  belongs_to :user
  belongs_to :job_posting
  
  validates_presence_of :differentiator_question
  validates_length_of :name, :minimum => 3, :too_short => "Please give a more complete answer"
  
end
