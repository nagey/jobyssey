class AdministrativeDivision < ActiveRecord::Base
  belongs_to :country
  belongs_to :geo_position
  has_many :work_history_items
end
