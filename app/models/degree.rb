class Degree < ActiveRecord::Base
  belongs_to :user
  belongs_to :educational_institution
  belongs_to :educational_qualification
  belongs_to :education_concentration
  belongs_to :educational_level
  
  validates_presence_of :user
  validates_presence_of :educational_institution
  validates_presence_of :education_concentration 
  validates_presence_of :educational_qualification
  validates_presence_of: :educational_level
end
