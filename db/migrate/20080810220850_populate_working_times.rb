class PopulateWorkingTimes < ActiveRecord::Migration
  def self.up
    
  a = ["Full Time", "Part Time"]
     a.each do |name|
        temp = WorkingTime.new
        temp.name = name
        temp.save
      end
  end

  def self.down
  end
end
