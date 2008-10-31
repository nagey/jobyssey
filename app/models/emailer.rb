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
      
      def new_application(employer, job_title, professional, sent_at = Time.now) #cv
          # You only need to customize @recipients.
          @recipients = employer 
          @from = "info@jobyssey.com"
          @subject = "New application for " + job_title
          @sent_on = sent_at
          body[:job_title] = job_title
          content_type "text/html"
         
          #@attachment = cv
          #  attachment "application/octet-stream" do |a|  
          #      a.body = File.read(cv)  
          #     a.filename = file.original_filename  
          # end
      end
      
      def new_invitation(professional, job_title, employer, sent_at = Time.now)
          # You only need to customize @recipients.
          @recipients = professional 
          @from = "info@jobyssey.com"
          @subject = "New invitation to apply for " + job_title + " at " + employer
          @sent_on = sent_at
         body[:employer] = employer
         body[:job_title] = job_title
          content_type "text/html"

      end
  
end
