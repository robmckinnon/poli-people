# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout "application"
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def index
  end

  def render_not_found message='Page not found.'
    @title = "Page cannot be found (404 error)"
    @crumbtrail = "Error: page cannot be found"
    render :template => 'public/404.html', :status => 404
  end

end
