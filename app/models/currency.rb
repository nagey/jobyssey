class Currency < ActiveRecord::Base
  has_and_belongs_to_many :countries
  
  validates_presence_of :name
  validates_presence_of :symbol
  validates_presence_of :currency_code
  validates_length_of :currency_code, :is => 3
end
