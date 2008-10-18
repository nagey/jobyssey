class AssociateTownsWithIreland < ActiveRecord::Migration
  def self.up
    country = Country.find 1
    AdministrativeDivision.find(:all).each do |e|
      e.country = country
      e.save
    end
  end

  def self.down
  end
end
