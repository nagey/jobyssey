class Login < ActiveRecord::Base
  belongs_to :user
  belongs_to :geo_position
end
