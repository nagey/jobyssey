class Professional < User

  has_many :attachments, :as => :entity
  has_one :cv, :as => :entity
      
end
