class Degree < ActiveRecord::Base
  belongs_to :user
  belongs_to :educational_institution
  belongs_to :educational_qualification
  belongs_to :education_concentration
  belongs_to :educational_level
end
