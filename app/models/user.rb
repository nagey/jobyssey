class User < ActiveRecord::Base
  has_many :benefits, :through => :user_benefit_preferences
  has_and_belongs_to_many :addresses
  has_many :differentiator_answers
  has_many :educational_qualification, :through => :degrees
  has_many :educational_institutions, :through => :degrees
  has_many :education_concentrations, :through => :degrees
  has_many :job_applications
  has_many :job_application_statuses
  has_many :geo_positions, :through => :logins
  has_many :metrics, :through => :personality_qualities
  has_many :phone_numbers
  has_and_belongs_to_many :roles
  belongs_to :employer
  has_many :work_history_items
  
  def name
    first_name + " " + middle_names.chars.first + " " + last_name
  end  
  
end
