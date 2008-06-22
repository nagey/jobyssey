class AdministrativeDivision < ActiveRecord::Base
  belongs_to :country
  belongs_to :geo_position_id
end
