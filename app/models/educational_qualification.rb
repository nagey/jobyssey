class EducationalQualification < ActiveRecord::Base
  has_many :users, :through => :degrees
  belongs_to :educational_level
  
  validates_presence_of :name
end
