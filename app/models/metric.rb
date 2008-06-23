class Metric < ActiveRecord::Base
  has_many :users, :through => :personality_qualities
end
