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
