class PopulateEmploymentTypes < ActiveRecord::Migration
  def self.up
    
    a = ["Permanent", "Contract", "Temporary"]
       a.each do |name|
          temp = EmploymentType.new
          temp.name = name
          temp.save
        end
    
    
  end

  def self.down
  end
end
