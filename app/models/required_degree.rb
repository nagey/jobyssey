class RequiredDegree < ActiveRecord::Base
  belongs_to :job_posting
  belongs_to :education_concentration
  belongs_to :educational_level
end
