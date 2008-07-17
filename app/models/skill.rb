<<<<<<< HEAD:app/models/skill.rb
class Skill < ActiveRecord::Base
=======
class Skill < Metric
  
  has_many :synonyms, :class_name => 'Skill', :foreign_key => 'synonym_id'
  belongs_to :synonym, :class_name => 'Skill'
  
  def name=(name)
    self.display_name = name unless self.name == name
    self.method_missing 'name=', name.downcase
  end
  
  def regexp
    pattern = '('+self.synonyms.collect { |s| s.clean_name }.join('|')+'|'+self.clean_name+')' unless self.synonyms.empty?
    pattern ||= self.clean_name
    #TODO add handler for /, but need to debug first
    Regexp.new('[\s\t\n\r:;.,]'+pattern+'[\s\t\n\r:;.,]', true)
  end
  
  def clean(mystr)
    mystr.chars.gsub(/([\\.?*+\[\]\(\)\{\}])/) {|s| '\\'+s}.gsub(' ','\s')
  end
  
  def clean_name
    clean name
  end
  
  def other_names
    synonyms.collect {|s| s.display_name }.join(', ')
  end
  
  def other_names=(names)
    names = names.split(',').collect{|s| s.strip}
    the_synonyms = self.synonyms.collect { |s| s.name }
    names.each do |name|
      unless the_synonyms.member? name.downcase
        skill = Skill.new
        skill.name = name
        self.synonyms << skill
        skill.save
      end
    end
    self.save
  end
  
>>>>>>> c0965a58b5dee903c5648133067d90e370de9c0c:app/models/skill.rb
end
