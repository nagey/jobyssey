class MessagesController < ApplicationController
  
  def employer_questions
  end
  
  def send_employer_inquiry
     Emailer.deliver_employer_inquiry(params[:inquiry][:email], params[:inquiry][:name], params[:inquiry][:company], params[:inquiry][:phone], params[:inquiry][:notes])
     flash[:notice] = "Thanks for your interest!  Someone from Jobyssey will be emailing you shortly to answer your questions.  In the meantime, please feel free to peruse our Employers section to find out more about what we offer."
     redirect_to :controller => :jobyssey, :action => :employers  
   end
   
   def general_questions
   end
  
   def send_general_inquiry
      Emailer.deliver_general_inquiry(params[:inquiry][:email], params[:inquiry][:name], params[:inquiry][:notes])
      flash[:notice] = "Thanks for your interest!  Someone from Jobyssey will be emailing you shortly to answer your questions."
      redirect_to :controller => :jobyssey, :action => :index  
    end
    
    def send_client_inquiry
      @employer = session[:user].employer
      @employee = session[:user]
      Emailer.deliver_client_inquiry(@employee, @employee.name, @employer, params[:inquiry][:notes])
       flash[:notice] = "Thanks for your email.  We'll get back to you as soon as possible."
       redirect_to :controller => :employers, :action => :home  
     end
  
end
