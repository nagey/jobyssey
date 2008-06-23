class EducationalInstitution < ActiveRecord::Base
  belongs_to :town
  belogns_to :country
  belongs_to :geo_position
  has_many :users, :through => :degrees
end
