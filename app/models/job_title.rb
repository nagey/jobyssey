class JobTitle < ActiveRecord::Base
  has_many :work_history_items
  
  validates_presence_of :name
end
