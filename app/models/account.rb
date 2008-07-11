class Account < ActiveRecord::Base
  belongs_to :employer
  has_many :transactions
  
  validates_numericality_of :balance, :only_integer => true
  
  def name
    employer.name
  end

end
