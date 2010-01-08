# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  # ensure_application_is_installed_by_facebook_user 
  before_filter :set_facebook_session
  
  filter_parameter_logging :fb_sig_friends
  
  helper_method :logged_in?, :facebook_session, :current_user
  
  private

  def current_user
    return @current_user if @current_user
    return @current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !session[:user_id].nil?
  end
    
  def login_required
    if session[:user_id].nil?
      # reset_session
      respond_to do |format|
        format.html {
          session[:requested_uri] = request.request_uri
          flash[:error] = "You must be logged in to view this page. Please login..."
          redirect_to login_path
        }
        format.js {
          render :update do |page|
            flash[:error] = "You must be logged in to view this page. Please login..."
            page.redirect_to(login_path)
          end
        }
      end
    end
  end

end
