class Metric < ActiveRecord::Base
  has_many :users, :through => :personal_qualities
  has_many :personal_qualities
  validates_presence_of :name, :type
  
  def form_name
    name.tr('+=&','')
  end
end
