class Professional < User

  has_many :attachments, :as => :entity
  has_one :cv, :as => :entity

  def code_id
    code_name.tr(' ','-').downcase
  end
  
  def self.code_name_from_id(id)
    names = id.split('-')
    middle_names = id.split('-')
    middle_names.pop
    middle_names.shift
    middle = middle_names.inject { |middle, name| middle += ' '+name }
    names[0].capitalize+' '+middle+' '+names[names.length-1].capitalize
  end
  
  def set_search_position
  end
   
   
  def best_skills
    if my_skills.nil?
      return
    else
      my_skills.sort_by { |pq| pq.value }.reverse.delete_if { |pq| pq.value == 0 }
    end
  end  
      
  
      
end
