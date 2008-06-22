class Town < ActiveRecord::Base
  has_many :addresses
end
