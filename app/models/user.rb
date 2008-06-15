class User < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :name, :code_name
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, :if => :password_changed?
end
