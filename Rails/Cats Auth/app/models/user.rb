class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 5, maximum: 20 }, allow_nil: true
  validates :session_token, presence: true

  has_many :cats, class_name: :Cats, foreign_key: :user_id
  has_many :cat_rental_requests, class_name: :CatRentalRequest, foreign_key: :user_id

  attr_reader :password

  after_initialize do
    ensure_session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && User.correct_password?(user, password)

    nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!
    session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  def self.generate_session_token
    require 'securerandom'
    SecureRandom.urlsafe_base64
  end

  def self.correct_password?(user, password)
    BCrypt::Password.new(user.password_digest).is_password?(password)
  end
end
