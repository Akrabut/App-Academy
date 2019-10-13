class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.includes(:rental_requests).find_by(id: require_params(:id))
    @cat ? (render :show) : (redirect_to cats_url)
  end

  def new
    @cat = Cat.new
  end

  def create
    some_cat = Cat.new(permit_params(:name, :birth_date, :color, :sex, :description))
    some_cat.save ? (redirect_to "/cats/#{some_cat.id}") : (render :new)
  end

  def edit
    @cat = Cat.find_by(id: require_params(:id))
    @cat ? (render :edit) : (redirect_to "/cats/#{@cat.id}/edit")
  end

  def update
    options = permit_params(:name, :birth_date, :color, :sex, :description)
    some_cat = Cat.find(require_params(:id))
    if some_cat
      some_cat.update(options)
      render some_cat
    else render :edit
    end
  end

  private

  def require_params(key)
    params.require(key)
  end

  def permit_params(*args)
    params.require(:cat).permit(args)
  end
end
