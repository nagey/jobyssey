class Town < ActiveRecord::Base
  has_many :addresses
  has_many :post_codes
  belongs_to :country
  belongs_to :administrative_division
  belongs_to :geo_position
  has_many :work_history_items

  alias_method :old_country, :country

  def country
    old_country unless old_country.nil?
    administrative_division.country 
  end

end
