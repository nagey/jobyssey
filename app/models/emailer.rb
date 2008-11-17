class Emailer < ActionMailer::Base
      
      def new_application(employer, job_title, professional, sent_at = Time.now) #cv
          @recipients = employer 
          @bcc = "richard@jobyssey.com, christina@jobyssey.com"
          @from = "info@jobyssey.com"
          @subject = "New application for " + job_title
          @sent_on = sent_at
          body[:job_title] = job_title
          content_type "text/html"
      end
      
      def new_invitation(professional, job_title, employer, sent_at = Time.now)
  
          @recipients = professional 
          @bcc = "richard@jobyssey.com, christina@jobyssey.com"
          @from = "info@jobyssey.com"
          @subject = "New invitation to apply for " + job_title + " at " + employer
          @sent_on = sent_at
          body[:employer] = employer
          body[:job_title] = job_title
          content_type "text/html"
      end
      
      def employer_inquiry(email, name, company, phone, notes)
          @recipients   = "richard@jobyssey.com"
          @from         = email
          headers         "Reply-to" => "#{email}"
          @subject      = "Employer Inquiry- " + name + " at " + company
          @sent_on      = Time.now
          @content_type = "text/html"

         	body[:name] = name
        	body[:company] = company
        	body[:phone] = phone
        	body[:notes] = notes
      end
      
      def general_inquiry(email, name, notes)
          @recipients   = "info@jobyssey.com"
          @from         = email
          headers         "Reply-to" => "#{email}"
          @subject      = "General Inquiry- " 
          @sent_on      = Time.now
          @content_type = "text/html"

         	body[:name] = name
        	body[:notes] = notes
      end
       
      def client_inquiry(email, name, company, phone, notes)
          @recipients   = "richard@jobyssey.com"
          @from         = email
          headers         "Reply-to" => "#{email}"
          @subject      = "Client Inquiry- " + name + " at " + company
          @sent_on      = Time.now
          @content_type = "text/html"

         	body[:name] = name
        	body[:company] = company
        	body[:phone] = phone
        	body[:notes] = notes
      end 
  
end
