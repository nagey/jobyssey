class JobPostingRequirement < ActiveRecord::Base
  belongs_to :job_posting
  belongs_to :metric
  validates_uniqueness_of :metric_id, :scope => "job_posting_id", :message => "You've already got one!"
  
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
