class UsersController < ApplicationController
  
  before_filter :login_required
  
  def index
    @friends = facebook_session.user.friends
  end
  
end
