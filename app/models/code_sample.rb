class CodeSample < ActiveRecord::Base
  belongs_to :code_sample_question
  belongs_to :user
end
