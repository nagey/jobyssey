class Invite < ActiveRecord::Base

  usesguid

  belongs_to :user
  belongs_to :signed_up_as_user, :class_name => "User"
  

  def recipient_list
  end

  def valid?
    (email_sent == true and signed_up_as_user.nil?)
  end

end
