class PersonalQuality < ActiveRecord::Base
  belongs_to :user
  belongs_to :metric
  validates_uniqueness_of :metric_id, :scope => "user_id"
  
  
  
end
