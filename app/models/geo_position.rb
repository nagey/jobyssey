class GeoPosition < ActiveRecord::Base
  has_many :addresses
  has_many :administrative_divisions
end
