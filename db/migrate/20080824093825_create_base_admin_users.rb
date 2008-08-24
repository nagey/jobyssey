class CreateBaseAdminUsers < ActiveRecord::Migration
  def self.up
    b = Role.new
    b.name = 'Admin'
    b.employer_id = 0
    b.save
    d = Role.find_by_name_and_employer_id('Admin',0)
    a = User.new
    a.name = 'Christina Nagey'
    a.email = 'christina@jobyssey.com'
    a.roles << d
    a.set_password('huCHac9u')
    a.save_without_validation
    c = User.new
    c.name = 'Stefan Nagey'
    c.email = 'stefan@nagey.com'
    c.roles << d
    c.set_password('QU8reB5a')
    c.save_without_validation
    e = User.new
    e.name = 'Richard Caballero'
    e.email = 'richard@jobyssey.com'
    e.roles << d
    e.set_password('re2EsPA3')
    e.save_without_validation
  end

  def self.down
    b = Role.find_by_name_and_employer_id('Admin', 0)
    b.destroy
    a = User.find_by_email('christina@jobyssey.com')
    a.destroy
    a = User.find_by_email('richard@jobyssey.com')
    a.destroy
    a = User.find_by_email('stefan@nagey.com')
    a.destroy
  end
end
