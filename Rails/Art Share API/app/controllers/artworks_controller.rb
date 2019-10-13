class ArtworksController < ApplicationController
  def index
    user = User.find(required_params(:user_id)).first
    render json: ['SHARED WITH ME:', user.shared_artworks, 'MY WORKS:', user.artworks]
  end

  def show
    artwork = find_artwork
    artwork ? (render json: find_artwork) : error_message(artwork)
  end

  def create
    artwork = Artwork.new(permitted_params(:title, :image_url, :artist_id))
    artwork.save ? (render json: artwork) : error_message(artwork)
  end

  def update
    artwork = find_artwork
    artwork ? Artwork.update(artwork.id, permitted_params(:title, :image_url, :artist_id)) : error_message(artwork)
  end

  def destroy
    artwork = find_artwork
    artwork ? (render json: artwork.destroy) : error_message(artwork)
  end

  private

  def find_artwork
    Artwork.find(required_params(:id)).first
  end

  def required_params(key)
    params.require(key) if params[key]
  end

  def permitted_params(*args)
    params.require(:artwork).permit(args) if params[:artwork]
  end

  def error_message(artwork)
    render json: artwork.errors.full_messages, status: :unprocessable_entity
  end
end
