class PostCode < ActiveRecord::Base
  belongs_to :town
  belongs_to :geo_position
  
  validates_presence_of :name
end
