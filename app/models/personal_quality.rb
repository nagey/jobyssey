class PersonalQuality < ActiveRecord::Base
  belongs_to :user
  belongs_to :metric
end
