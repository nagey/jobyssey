class Attachment < ActiveRecord::Base

  belongs_to :entity, :polymorphic => true
  
  def attachment=(field)
    self.file_name = base_part_of(field.original_filename) 
    self.content_type = field.content_type.chomp 
    self.method_missing 'attachment=', field.read
  end
  
  def base_part_of(file_name) 
    File.basename(file_name).gsub(/[^\w._-]/, '') 
  end 
  
  def set_search_position
    search_position = '['+personal_qualities.collect {|pq| pq.value.to_s}.join(',')+']'
  end
  

end
