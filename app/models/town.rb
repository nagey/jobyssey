class Town < ActiveRecord::Base
  has_many :addresses
  has_many :post_codes
  belongs_to :country
  belongs_to :administrative_division
  belongs_to :geo_position
  has_many :work_history_items
end
