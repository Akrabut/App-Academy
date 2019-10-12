class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  belongs_to :submitter, class_name: "User", foreign_key: :user_id
  has_many :visits, class_name: "Visit", foreign_key: :url_id
  has_many :visitors, through: :visits, source: :visitor

  def subtable
    Visit.where(url_id: id)
  end

  def num_clicks
    subtable.count
  end

  def num_uniques
    subtable.select(:user_id).distinct.count
  end

  def num_recent_uniques
    subtable.select { |row| 10.minutes.ago <= row.created_at }.map(&:user_id).uniq.count
  end

  def no_spamming(id)
    ShortenedUrl.where(user_id: id).count { |row| row.created_at >= 1.minute.ago } < 5
  end

  def self.random_code
    require 'securerandom'
    loop do
      token = SecureRandom::urlsafe_base64(16)
      return token unless ShortenedUrl.exists?(short_url: token)
    end
  end

  def self.factory(user, g_long_url)
    url = ShortenedUrl.find_by(long_url: g_long_url)
    return url if url

    ShortenedUrl.create!(long_url: g_long_url, short_url: ShortenedUrl.random_code, submitter: user)
  end
end
