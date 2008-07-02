class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :job_application

  @@transaction_types = %w( credit debit refund )
    
  validates_inclusion_of :transaction_type, :in => @@transaction_types, :message => l(:invalid_transaction_type)

  def transaction_types
    @@transaction_types
  end

end
