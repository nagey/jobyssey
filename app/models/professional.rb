class Professional < User

  has_many :attachments, :as => :entity
  has_one :cv, :as => :entity

  def code_id
    code_name.tr(' ','-').downcase
  end
  
  def self.code_name_from_id(id)
    names = id.split('-')
    names[0].capitalize+' '+names[1]+' '+names[2].capitalize
  end
  
  def set_search_position
  end
      
end
