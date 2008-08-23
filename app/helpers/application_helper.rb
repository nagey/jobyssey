# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #def title(site_name)
  #  if site_name.class == String
  #    "<h1>" + site_name + "</h1>"
  #  elsif site_name.class == hash
  #    site_name[:site_name]
  #  else
  #    site_name
  #  end
  #end

  def authenticated?
    return false if session[:user].nil?
    session[:user]
  end

  def professional?
    true
  end
  
  def employer?
    false
  end

end
