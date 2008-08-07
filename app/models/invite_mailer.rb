class InviteMailer < ActionMailer::Base
  

  def invite(invite)
    subject    "#{invite.user.name} invites you to join them at Jobyssey.com"
    recipients invite.email
    from       invite.user.email
    sent_on    Time.now

    body       :invite => invite
  end

  def sent(sent_at = Time.now)
    subject    'InviteMailer#sent'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
