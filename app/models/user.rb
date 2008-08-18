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
  belongs_to :working_time
  belongs_to :employment_type
  
  validates_confirmation_of :email

  validates_presence_of :first_name, :last_name
  validates_acceptance_of :terms_of_service, :message => "You must agree to the Terms of Service to continue.", :on => :create
  validates_presence_of :password_confirmation, :if => :password_changed?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email, :message => "We've already got someone registered to this email address.  Please click on Forgot Password in the login bar if you don't remember your password."
  validates_length_of :password, :within => 1..20, :too_long => "pick a shorter password", :too_short => "pick a longer password"




#attr_accessor :password_confirmation
validates_confirmation_of :password

#validate :password_non_blank

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
 

  
#def password
#  @password
#end

#def password=(pwd)
#  @password = pwd
#  retrun if pwd.blank?
#  create_new_salt
#  self.password = User.encrypted_password(self.password, self.salt)
#end

def self.authenticate(name, password)
  user = self.find_by_name(name)
  if user
    expected_password = encrypted_password(password, user.salt)
    if user.password != expected_password
      user = nil
    end
  end
  user
end
  
private

def password_non_blank
  errors.add_to_base("Missing Password") if password.blank?
end  

def self.encrypted_password(password, salt)
    string_to_hash = password + "Albequerque" + salt
    Digest::SHA1.hexdigest(string_to_hash)
end

def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
end
  
end
