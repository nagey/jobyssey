class Professional < User

  has_many :attachments, :as => :entity
  has_one :cv, :as => :entity

    
  def set_search_position
  end
  
  def three_questions
  end
  
  def code_sample
  end
      
end
