class Professional < User
  validates_format_of :cv_content_type, :with => /(word|pdf)/, :message => l(:upload_only_word_or_pdf)
  
  def upload_cv=(cv_field)
    self.cv_name = base_part_of(cv_field.original_filename) 
    self.cv_content_type = cv_field.content_type.chomp 
    self.cv = cv_field.read
  end
  
  def base_part_of(file_name) 
    File.basename(file_name).gsub(/[^\w._-]/, '') 
  end 
  
  def set_search_position
    search_position = '['+personal_qualities.collect {|pq| pq.value.to_s}.join(',')+']'
  end
    
end
