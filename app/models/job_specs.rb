class JobSpecs < Attachment
  validates_format_of :content_type, :with => /(word|pdf)/, :message => "Please upload a word or pdf file"
  
  def skills
    #TODO make this handle synonyms please!
    Skill.find(:all).collect {|s| s.regexp.match(self.attachment)}.collect{|m| Skill.find_by_name(m[0][1..m[0].length-2].downcase) unless m.nil?}.delete_if {|x| x.nil?}
  end
  
end
