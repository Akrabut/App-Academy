class UsersController < ApplicationController
  def index
    if (query = required_params(:query))
      query = '%' << query << '%'
      render json: User.where('username like (?)', query)
    else render json: User.all
    end
  end

  def create
    user = User.new(permitted_params(:username))
    user.save ? (render json: user) : error_message(user)
  end

  def show
    render json: User.find(required_params(:id))
  end

  def update
    user = User.update(required_params(:id), permitted_params(:username))
    user.save ? (render json: user) : error_message(user)
  end

  def destroy
    user = User.find(required_params(:id))
    user.destroy ? (render json: user) : error_message(user)
  end

  private

  def permitted_params(*args)
    params.require(:user).permit(args) if params[:user]
  end

  def required_params(key)
    params.require(key) if params[key]
  end

  def error_message(user)
    render json: user.errors.full_messages, status: :unprocessable_entity
  end
end
