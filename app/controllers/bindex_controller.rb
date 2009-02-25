class BindexController < ApplicationController
  
    layout "bindex"
  
  def bindex
    render :action => :bindex, :layout => "foo"
  end
  
end
