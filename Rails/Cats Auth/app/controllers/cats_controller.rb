class CatsController < ApplicationController
  before_action :validate_cat_owner

  def validate_cat_owner
    return unless %w[update edit].include?(action_name)

    return if cat_owner?

    flash[:error] = 'This is not your cat, bruh'
    redirect_to cats_url
  end

  helper_method :cat_owner?
  def cat_owner?
    current_user.id == user_id if current_user
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.where(id: id).first
    render :edit
  end

  def update
    @cat = current_user.cats.where(id: id).first
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
