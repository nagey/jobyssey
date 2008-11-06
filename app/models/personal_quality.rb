class PersonalQuality < ActiveRecord::Base
  belongs_to :user
  belongs_to :metric
  validates_uniqueness_of :metric_id, :scope => "user_id"
  
  def name_trait
   
      if value < 30
         return metric.lower_bound + "<br>"
      elsif value > 70
         return metric.upper_bound + "<br>"
      else  
       return    
      end
  end
  
end
