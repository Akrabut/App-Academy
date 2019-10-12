class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :submitted_urls, class_name: "ShortenedUrl", foreign_key: :user_id
  has_one :visit, class_name: "Visit", foreign_key: :user_id
  has_many :visited_urls, through: :visit, source: :url
end
