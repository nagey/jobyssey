class Emailer < ActionMailer::Base
  
  class Emailer < ActionMailer::Base
      def contact_email(email_params, sent_at = Time.now)
          # You only need to customize @recipients.
          @recipients = "contact@website.co.uk" 
          @from = email_params[:name] + " <" + email_params[:address] + ">" 
          @subject = email_params[:subject]
          @sent_on = sent_at
          @body["email_body"] = email_params[:body]
          @body["email_name"] = email_params[:name]
      end
  end
  

end
