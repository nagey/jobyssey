class PopulateEducationalQualifications < ActiveRecord::Migration
  def self.up 
    a = { "Leaving Certificate" => 0, "A Level" => 0, "MCSE" => 1, "MCSD" => 1, "MCSA" => 1, "CCNA" => 1, "HND" => 2, "BA" => 3, "BSc" => 3, "MA" => 4, "MSc" => 4, "PhD" => 5, "Post doctoral study" => 6 }
    
    (0..10).each do |level|
      l = EducationalLevel.new
      l.level = level
      l.save
    end

    a.each_pair do |name, educational_level_id|
      temp = EducationalQualification.new
      temp.name = name
      temp.educational_level = EducationalLevel.find_by_level educational_level_id
      temp.save
    end  
  end

  def self.down
  end
end
