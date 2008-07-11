class Address < ActiveRecord::Base
  belongs_to :town
  belongs_to :geo_position
  has_and_belongs_to_many :users
  has_and_belongs_to_many :employers
  
  validates_presence_of :town
  validates_length_of :address1, :minimum => 5
end
