class JobTitle < ActiveRecord::Base
  has_many :work_history_items
end
