class SessionsController < ApplicationController
  before_action do |_|
    if %w[new create].include?(action_name) && logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to cats_url
    end
  end

  def new
  end

  def create
    permit_params(:username, :password)
    # use this to know where to return in case of failure
    flash.now[:controller] = 'sessions'
    login_user!(params[:session][:username], params[:session][:password])
  end

  def destroy
    return unless current_user

    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to cats_url
  end

  private

  def permit_params(*args)
    params.require(:session).permit(args)
  end
end
