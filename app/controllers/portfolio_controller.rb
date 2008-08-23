class PortfolioController < ApplicationController
  
  def links
    @links
  end
  
  def add_a_link
    @l = Attachment.new
    @l.entity_type = "link"
    @l.name = name
    @l.url = url
    @l.description = description
    l.save
  end  

end
