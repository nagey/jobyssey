class MapsController < ApplicationController
  
  
  
  def index
    @a = Address.find 1
    @map = init_map @a
  end
end
