class JobysseyController < ApplicationController

  layout 'index'

  def about
  end

  def contact
  end

  def copyright
  end

  def index
    @professional = Professional.new
  end

  def logout
    session[:user] = nil
    redirect_to :action => :index
  end

  def login
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user
        Login.record_login user, request.remote_ip
        session[:user] = user
        uri = session[:previous_uri]
        session[:previous_uri] = nil
        redirect_to(uri || { :controller => 'professionals', :action => 'home' })
      else
        flash.now[:notice] = l(:invalid_combination)
      end
    end
  end
end
