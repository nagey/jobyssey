class AddDublinPostCodesToTowns < ActiveRecord::Migration
  def self.up
    a = ["Dublin 1", "Dublin 2", "Dublin 3", "Dublin 4", "Dublin 5", "Dublin 6", "Dublin 7", "Dublin 8", "Dublin 9", "Dublin 10", "Dublin 11", "Dublin 12", "Dublin 13", "Dublin 14", "Dublin 15", "Dublin 16", "Dublin 17", "Dublin 18", "Dublin 19", "Dublin 20", "Dublin 21", "Dublin 22", "Dublin 23", "Dublin 24"]
    
       a.each do |t|
         t2 = Town.new
         t2.administrative_division = AdministrativeDivision.find_by_name "Dublin"
         t2.name = t
         t2.save
       end
    
  end

  def self.down
  end
end
