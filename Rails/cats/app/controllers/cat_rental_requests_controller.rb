class CatRentalRequestsController < ApplicationController
  def index
    @cats = CatRentalRequest.joins('join cats on cats.id = cat_id').select(:name, :start_date, :end_date, :status).order('start_date asc')
  end

  def new
    @cats = Cat.all.select(:id, :name)
  end

  def create
    request = CatRentalRequest.new(permit_params(:cat_id, :start_date, :end_date))

    request.save ? (render json: request) : (render :new)
  end

  private

  def permit_params(*args)
    params.require(:request).permit(args)
  end
end
