class Country < ActiveRecord::Base
  has_many :administrative_divisions
  has_and_belongs_to_many :currencies
  has_many :phone_numbers
  has_many :work_history_items

  validates_presence_of :phone_number_format
  validates_numericality_of :dialing_code
  validates_presence_of :use_administrative_division
  validates_presence_of :use_post_code
  validates_presence_of :name
end
