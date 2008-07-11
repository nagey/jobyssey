class User < ActiveRecord::Base
  has_many :benefits, :through => :user_benefit_preferences
  has_and_belongs_to_many :addresses
  has_many :differentiator_answers
  has_many :educational_qualification, :through => :degrees
  has_many :educational_institutions, :through => :degrees
  has_many :education_concentrations, :through => :degrees
  has_many :job_applications
  has_many :job_application_statuses
  has_many :geo_positions, :through => :logins
  has_many :metrics, :through => :personal_qualities
  has_many :personal_qualities
  has_many :phone_numbers
  has_and_belongs_to_many :roles
  belongs_to :employer
  has_many :work_history_items
  has_many :feedback_items
  
  validates_confirmation_of :email
  validates_confirmation_of :password
  validates_presence_of :first_name, :last_name
  validates_acceptance_of :terms_of_service, :message => "You must agree to the Terms of Service to continue.", :on => :create
  validates_presence_of :password_confirmation, :if => :password_changed?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email, :message => "We've already got someone registered to this email address.  Please click on Forgot Password in the login bar if you've forgotten yours."
  validates_length_of :password, :within => 6..20, :too_long => "pick a shorter password", :too_short => "pick a longer password"


  def name=(name_field)
    names = name_field.split(' ')
    self.first_name = names.shift
    self.last_name = names.pop
    self.middle_names = names.join(' ')
  end

  def name
    self.first_name + ' ' + self.middle_names + ' ' + self.last_name unless self.first_name.nil?
  end

  def skills
    metrics.collect {|x| x unless x.class != Skill}.delete_if { |x| x.nil? }
  end

  def traits
    metrics.collect {|x| x unless x.class != Trait}.delete_if { |x| x.nil? }
  end

  def name
    first_name + " " + middle_names.chars.first + " " + last_name
  end  
  
end
