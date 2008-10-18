class GeoPosition < ActiveRecord::Base
  has_many :addresses
  has_many :administrative_divisions
  has_many :employers
  has_many :educational_institutions
  has_many :users, :through => :logins
  has_many :logins
  has_many :post_codes
  has_many :towns
  has_many :work_history_items
 
  require 'geoip'
  @@geo_ip = GeoIP.new('db/GeoIPCity.dat')
 
  def name
    latitude.to_s + longitude.to_s
  end

  def self.get_position(to_lookup)
    pos = @@geo_ip.city(to_lookup)
    geo_pos = self.find_by_longitude_and_latitude(pos[10],pos[9])
    if geo_pos.nil?
      geo_pos = self.new
      geo_pos.longitude = pos[10]
      geo_pos.latitude = pos[9]
      geo_pos.save
    end
    geo_pos
  end

end
