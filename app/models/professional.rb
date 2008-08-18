class Professional < User

  has_many :attachments, :as => :entity
  has_one :cv, :as => :entity
  
    
  def set_search_position
  end
  
      
end
