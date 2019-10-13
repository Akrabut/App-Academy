class User < ApplicationRecord
  validates :name, presence: true, length: { minimum:  2, maximum: 50 }
  validates :email, presence: true, length: { minimum:  5, maximum: 254 }
end
