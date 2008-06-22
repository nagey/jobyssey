class User < ActiveRecord::Base
  has_many :benefits, :through => :user_benefit_preferences
  has_and_belongs_to_many :addresses
end
