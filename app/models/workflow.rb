class Workflow < ActiveRecord::Base
  has_and_belongs_to_many :employers
end
