class Account < ActiveRecord::Base
  belongs_to :employer
  validate_numericality_of :balance, :only_integer => true
end
