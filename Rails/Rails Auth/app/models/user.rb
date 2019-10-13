class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :username, :session_token, presence: true, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 20}
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 5, maximum: 20 }, allow_nil: true

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && User.correct_password?(user, password)

    nil
  end

  def self.generate_session_token
    require 'securerandom'
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    session[:session_token] = User.generate_session_token
    self.session_token = session[:session_token]
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

  def self.correct_password?(user, password)
    BCrypt::Password.new(user.password_digest).is_password?(password)
  end
end
