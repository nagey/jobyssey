# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
   layout 'index'
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => '33d8bb90383499753b4f0351d0cb773a'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def set_language
      params[:lang] ||= 'en'
      Localization.use params[:lang]
  end

  def authenticated?
    return false if session[:user].nil?
    session[:user]
  end

  def authenticate(options = {})
    role = nil
    employer_id = nil
    if session[:user].nil?
      session[:previous_uri] = request.request_uri
      flash[:notice] = "Please login, and localize me"
      redirect_to :controller => "jobyssey", :action => "login" if session[:user].nil?
    end
    options.each_pair do |key,value|
      case key
      when :employer_id
        employer_id = value
      when :employer_name
        employer = Employer.find(value)
        employer_id = employer.id unless employer.nil?
      when :role
        role = value
      end
    end
    unless role.nil?
      employer_id = 0 if employer_id.nil?
      raise "Not Authorized" unless session[:user].roles.member? Role.find_by_employer_id_and_name(employer_id,role)
    end
    true
  end

  def authenticate_professional
    self.authenticate_by_user_type('Professional')
  end

  def authenticate_employer
    self.authenticate_by_user_type('Employer')
  end
  
  def authenticate_user
    self.authenticate_by_user_type("User")
  end
  
  def authenticate_by_user_type(classname)
    if self.authenticate
      raise "Not Authorized" unless session[:user].class.to_s == classname.to_s
    end
  end

  def authorize_admin
    authenticate :role => "Admin", :employer_id => 0
  end

  def rescue_404
      rescue_action_in_public CustomNotFoundError.new
  end

  def rescue_action_in_public(exception)
    case exception
      when CustomNotFoundError, ::ActionController::UnknownAction, ActiveRecord::RecordNotFound, ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction then
        render :file => "/public/404.html"
      else
        @message = exception
        render :file => "/public/500.html"
    end
  end

  def local_request?
    return false
  end
end
