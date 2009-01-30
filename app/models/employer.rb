class Employer < ActiveRecord::Base
  has_one :account
  has_and_belongs_to_many :addresses
  has_many :differentiator_answers
  belongs_to :industry
  belongs_to :geo_position
  has_and_belongs_to_many :workflows
  has_many :roles
  has_many :images, :as => :entity
  has_many :default_roles, :class_name => "Role", :finder_sql => "SELECT DISTINCT roles.* from roles where employer_id is null"
  has_many :work_history_items
  has_one :administrator, :class_name => "User"
  has_many :job_postings
  
  validates_presence_of :name
  
  def premium?
    self.premium
  end
  
  
end
