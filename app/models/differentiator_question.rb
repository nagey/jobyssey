class DifferentiatorQuestion < ActiveRecord::Base
  has_many :differentiator_answers
  
  validates_presence_of :name, :type
end
