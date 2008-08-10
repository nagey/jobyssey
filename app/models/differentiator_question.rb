class DifferentiatorQuestion < ActiveRecord::Base
  has_many :differentiator_answers
  
  validates_presence_of :name, :type
  
  @@types = ['PersonalQuestion','JobPostingQuestion', 'EmployerQuestion']
  
  def types
    @@types
  end
  
  def types=
  end
  
end
