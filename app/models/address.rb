class Address < ActiveRecord::Base
  belongs_to :town
  belongs_to :geo_position
  has_and_belongs_to_many :users
  has_and_belongs_to_many :employers
end
