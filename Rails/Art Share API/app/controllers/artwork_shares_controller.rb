class ArtworkSharesController < ApplicationController
  def create
    artworkshare = ArtworkShare.new(permitted_params(:viewer_id, :artwork_id))
    artworkshare.save ? (render json: artworkshare) : error_message(artworkshare)
  end

  def destroy
    artworkshare = ArtworkShare.find(required_params(:id)).first
    artworkshare&.destroy
    artworkshare ? (render json: artworkshare) : error_message(artworkshare)
  end

  private

  def required_params(key)
    params.require(key) if params[key]
  end

  def permitted_params(*args)
    params.require(:artwork_share).permit(args) if params[:artwork_share]
  end

  def error_message(artworkshare)
    render json: artworkshare.errors.full_messages, status: :unprocessable_entity
  end
end
