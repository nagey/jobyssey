class Login < ActiveRecord::Base
  belongs_to :user
  belongs_to :geo_position


  def self.record_login(user, ip)
    a = self.new
    a.user = user
    a.ip_address = ip
    a.geo_position = GeoPosition.get_position ip
    a.save
  end

end
