class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params(:name, :email))
    user.save ? (render json: user) : error_message
  end

  def show
    render json: User.find(params.require(:id))
  end

  def update
    user = User.update(params.require(:id), user_params(:name, :email))
    user.save ? (render json: user) : error_message
  end

  def destroy
    user = User.find(params.require(:id))
    user.delete ? (render html: 'user deleted') : error_message
  end

  def user_params(*args)
    params.require(:user).permit(args)
  end

  def error_message
    render json: user.errors.full_messages, status: :unprocessable_entity
  end
end
