class Country < ActiveRecord::Base
  has_many :administrative_divisions
end
