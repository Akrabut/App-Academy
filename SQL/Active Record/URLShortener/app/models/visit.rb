class Visit < ApplicationRecord
  belongs_to :url, class_name: "ShortenedUrl", foreign_key: "url_id"
  belongs_to :visitor, class_name: "User", foreign_key: "user_id"

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor: user, url: ShortenedUrl.factory(user, shortened_url.long_url))
  end
end
