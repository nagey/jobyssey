class AdministrativeDivision < ActiveRecord::Base
  belongs_to :country
  belongs_to :geo_position_id
  has_many :work_history_items
end
