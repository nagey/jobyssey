class Industry < ActiveRecord::Base
  has_many :employers
  
  validates_presence_of :name
  
end
