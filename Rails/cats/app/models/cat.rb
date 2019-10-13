class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w[black brown orange white mixed].freeze

  validates :name, presence: true, uniqueness: true
  validates :color, :sex, presence: true
  validate :valid_date?

  validates_inclusion_of :sex,
    in: %w[M F].freeze,
    on: %i[create update],
    message: 'Possible values for sex are M and F'
  validates_inclusion_of :color,
    in: COLORS, 
    on: %i[create update],
    message: 'possible colors are black, brown, orange, white and mixed'

  has_many :rental_requests, class_name: :CatRentalRequest, foreign_key: :cat_id, dependent: :destroy

  def age
    require 'date'
    time_ago_in_words(birth_date)
  end

  def valid_date?
    require 'date'
    errors.add(:birth_date, 'Is this a time travelling cat?') if birth_date.to_date.future?
  end
end
