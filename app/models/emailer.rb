class Emailer < ActionMailer::Base
  
      def contact_email(email_params, sent_at = Time.now)
          # You only need to customize @recipients.
          @recipients = "info@jobyssey.com" 
          @from = email_params[:name] + " <" + email_params[:address] + ">" 
          @subject = email_params[:subject]
          @sent_on = sent_at
          @body["email_body"] = email_params[:body]
          @body["email_name"] = email_params[:name]
      end
      
      def new_application(employer, job_title, sent_at = Time.now)
          # You only need to customize @recipients.
          @recipients = employer 
          @from = "info@jobyssey.com"
          @subject = "New application for" + job_title
          @sent_on = sent_at
          @body["email_body"] = "You've recieved a new application for " + job_title + " at Jobyssey.  Please login and go to your activity section to view the users details."
          #@body["email_name"] = email_params[:name]
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
