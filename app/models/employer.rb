class Employer < ActiveRecord::Base
  has_one :account
  has_and_belongs_to_many :addresses
end
