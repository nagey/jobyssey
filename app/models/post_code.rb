class PostCode < ActiveRecord::Base
  belongs_to :town
  belongs_to :geo_position
end
