class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :account_id
      t.string :transaction_type
      t.integer :amount
      t.string :reference
      t.integer :job_application_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
