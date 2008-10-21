class Address < ActiveRecord::Base
  belongs_to :town
  belongs_to :geo_position
  has_and_belongs_to_many :users
  has_and_belongs_to_many :employers
  
  validates_presence_of :town
  validates_length_of :address1, :minimum => 5
  
  def to_gmap
    "#{address1}, #{address2}, #{town.name}, #{town.administrative_division.name}, #{town.country.name}"
  end
  
  def address
  end
  
  def employer_id
    @employers = Employer.find :all
  end
  
  def employer_id=(foo)
    #@employer = Employer.find_by_id(params[:employer_id])
  end
end
