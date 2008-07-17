class Metric < ActiveRecord::Base
  has_many :users, :through => :personality_qualities
  
  validates_presence_of :name, :type
  
end
