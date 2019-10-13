class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login_user!(username, password)
    @username = username
    @password = password
    user = User.find_by_credentials(username, password)
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_path
    else
      flash[:error] = 'Invalid user credentials'
      render "#{flash.now[:controller]}/new"
    end
  end

  def logged_in?
    current_user
  end
end
