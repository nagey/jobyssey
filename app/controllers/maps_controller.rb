class MapsController < ApplicationController
  
  require 'rubygems'
  require 'google_geocode'
  
  gg = GoogleGeocode.new "ABQIAAAAZAVm-mpajx99YuizrWDWYxQIkn2H0N7M-ZYoFDdHwoMzZRvYqBQqO6uJ6gczxIlZaSPYdkieKT3JDg"
  loc = gg.locate "102 7th St. SE, Washington, DC 20003" 
  
  @map = GMap.new("map_div")
  @map.control_init(:small => true) #add :large_map => true to get zoom controls
  @map.center_zoom_init([loc.latitude, loc.longitude],14)
  @map.overlay_init(GMarker.new([loc.latitude, loc.longitude],:title => @property.name, :info_bubble => loc.address))
end
