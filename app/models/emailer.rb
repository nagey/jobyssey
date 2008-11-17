class Emailer < ActionMailer::Base
      
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
        
  
end
