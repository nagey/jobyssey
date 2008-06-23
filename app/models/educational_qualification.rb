class EducationalQualification < ActiveRecord::Base
  has_many :users, :through => :degrees
  belongs_to :educational_level
end
