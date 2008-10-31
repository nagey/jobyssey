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

#A different example
  
  #def welcome(name, email)
  #   @recipients   = "user@host.com"
  #   @from         = params[:contact][:email]
  #   headers         "Reply-to" => "#{email}"
  #   @subject      = "Welcome to Add Three"
  #   @sent_on      = Time.now
  #   @content_type = "text/html"

  #   body[:name]  = name
  #   body[:email] = email       
  # end
  

end
