class PopulateIndustries < ActiveRecord::Migration
  def self.up
    
    a = ["Advertising", "Agriculture", "Architecture and Construction", "Automobiles", "Banking and Financial Services", "Biotechnology", "Broadcasting", "Business Consulting and Services", "Design", "Education", "Energy", "Entertainment", "Environmental Services and Waste Management", "Food and Beverage", "Gaming", "Hardware", "Healthcare", "Hotels", "IT Consulting", "Insurance", "Investment Services", "Manufacturing", "Pharmacueticals", "Retail", "Software", "Telecommunications", "Tourism", "Transportation"]
  
    a.each do |name|
      temp = Industry.new
      temp.name = name
      temp.save
    end
  end

  def self.down
  end
end
