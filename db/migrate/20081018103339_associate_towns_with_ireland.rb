class AssociateTownsWithIreland < ActiveRecord::Migration
  def self.up
    country = Country.new (:name => "Ireland", :dialing_code => "353") #:use_adminsitrative_divisions => true, :use_post_codes => false )
    country.save
    
    AdministrativeDivision.find(:all).each do |e|
      e.country = country
      e.save
    end
  end

  def self.down
  end
end
