class SessionsController < ApplicationController

  before_filter       :redirect_if_logged_in,     :only => [:new, :index]
  skip_before_filter  :verify_authenticity_token, :only => :new

  def index
    @question = Question.new
    render :layout => false
  end

  def new
  end

  def create
    begin
      if facebook_session
        fb_user = User.find_or_create_by_fb_userid(facebook_session.user.id)
        session[:user_id] = fb_user.id
        redirect_to polls_path
      else
        redirect_to login_path
      end
    rescue Facebooker::Session::SessionExpired
      clear_fb_cookies!
      reset_session
      flash[:warning] = "Your session has expired. Please login to continue..."
      redirect_to login_path
    end
  end

  def destroy
    clear_fb_cookies!
    reset_session
    redirect_to login_path
  end

  private

  def redirect_if_logged_in
    redirect_to polls_path if logged_in?
  end

end
