class EducationalInstitution < ActiveRecord::Base
  belongs_to :town
  belongs_to :country
  belongs_to :geo_position
  has_many :users, :through => :degrees
  
  validates_presence_of :name
    
end
