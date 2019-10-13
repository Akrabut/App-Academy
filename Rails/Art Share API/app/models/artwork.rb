class Artwork < ApplicationRecord
  validates_length_of :title, within: 2..50, message: 'Title must be between 2 and 50 characters'
  validates :title, :artist_id, :image_url, presence: true
  validates :artist_id, uniqueness: { scope: :title, message: 'You cant upload with the same title again' }

  has_many :artwork_shares, class_name: :ArtworkShare, foreign_key: :artwork_id, dependent: :destroy
  has_many :shared_viewers, through: :artwork_shares, source: :viewer

  has_many :comments, class_name: :Comment, foreign_key: :artwork_id

  belongs_to :artist, class_name: :User, foreign_key: :artist_id
end
