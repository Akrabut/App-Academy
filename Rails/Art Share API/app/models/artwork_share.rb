class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :viewer_id, uniqueness: { scope: :artwork_id, message: 'Already been shared with this user' }

  belongs_to :viewer, class_name: :User, foreign_key: :viewer_id, primary_key: :id
  belongs_to :artwork, class_name: :Artwork, foreign_key: :artwork_id, primary_key: :id
end
