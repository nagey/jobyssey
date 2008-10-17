class CreateCompanyQuestions < ActiveRecord::Migration
  def self.up
    create_table :company_questions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :company_questions
  end
end
