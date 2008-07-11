class GeoPosition < ActiveRecord::Base
  has_many :addresses
  has_many :administrative_divisions
  has_many :employers
  has_many :educational_institutions
  has_many :users, :through => :logins
  has_many :post_codes
  has_many :towns
  has_many :work_history_items
 
  def name
    latitude.to_s + longitude.to_s
  end
end
