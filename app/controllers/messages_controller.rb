class MessagesController < ApplicationController
  
  def employer_questions
  end
  
  def send_employer_inquiry
     Emailer.deliver_employer_inquiry(params[:inquiry][:email], params[:inquiry][:name], params[:inquiry][:company], params[:inquiry][:phone], params[:inquiry][:notes])
     flash[:notice] = "Thanks for your interest!  Someone from Jobyssey will be emailing you shortly to answer your questions.  In the meantime, please feel free to peruse our Employers section to find out more about what we offer."
     redirect_to :controller => :jobyssey, :action => :employers  
   end
  
end
