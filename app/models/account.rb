class Account < ActiveRecord::Base
  belongs_to :employer
  has_many :transactions
  
  validate_numericality_of :balance, :only_integer => true
end
