class UsersController < ApplicationController
  before_action :validate_logged_in

  def validate_logged_in
    return unless %w[new create].include?(action_name) && logged_in?

    flash[:error] = 'You are already logged in'
    redirect_to cats_url
  end

  def new
  end

  def create
    user = User.new(permit_params(:username, :password))
    @username = params[:user][:username]
    @password = params[:user][:password]
    user.save
    # use this to know where to return in case of failure
    flash.now[:controller] = 'users'
    login_user!(@username, @password)
  end

  private

  def permit_params(*args)
    params.require(:user).permit(args)
  end
end
