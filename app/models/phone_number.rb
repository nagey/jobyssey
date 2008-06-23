class PhoneNumber < ActiveRecord::Base
  belongs_to :phone_number_type
  belongs_to :user
  belongs_to :country

  def to_s
    #todo add formatting with self.country.phone_number_format
    '+'+self.country.dialing_code.to_s+self.number.to_s
  end

end
