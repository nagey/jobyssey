class Trait < Metric
  validates_presence_of :lower_bound
  validates_presence_of :upper_bound

  @@trait_types = ["Job Posting","Employer"]
  
  class << self
    def trait_types
      @@trait_types
    end
  end
  
end
