class CommentsController < ApplicationController
  def index
    if (id = require_params(:user_id))
      comments = User.includes(:comments).find(id)
      render json: ['COMMENTS FOR USER:', comments.comments]
    elsif (id = require_params(:artwork_id))
      comments = Artwork.includes(:comments).find(id)
      render json: ['COMMENTS FOR ARTWORK:', comments.comments]
    else render html: 'Invalid ID'
    end
  end

  def create
    comment = Comment.new(permit_params(:user_id, :artwork_id, :body))
    comment.save ? (render json: comment) : error_message(comment)
  end

  def destroy
    comment = Comment.find(require_params(:id))
    comment ? (render json: comment.destroy) : error_message(comment)
  end

  private

  def require_params(key)
    params.require(key) if params[key]
  end

  def permit_params(*args)
    params.require(:comment).permit(args) if params[:comment]
  end

  def error_message(comment)
    render json: comment.errors.full_messages, status: :unprocessable_entity
  end
end
