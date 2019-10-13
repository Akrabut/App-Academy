class CatRentalRequest < ApplicationRecord
  validates_inclusion_of :status, in: %w[PENDING APPROVED DENIED], message: 'status can be pending, approved or denied'
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :valid_date?, :not_overlapping?

  belongs_to :cat, class_name: :Cat, foreign_key: :cat_id

  def valid_date? # heh
    require 'date'
    errors.add(:start_date, "You aren't a time traveller") if start_date.to_date.future?
    errors.add(:start_date, 'Cant request a cat for a negative amount of time...') if start_date >= end_date
  end

  def overlapping_requests
    CatRentalRequest
      .where.not(id: id)
      .where(cat_id: cat_id)
      .where.not('end_date < (?) or start_date > (?)', start_date, end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def not_overlapping?
    errors.add(:start_date, "There's an overlapping approved request, choose another date") if overlapping_approved_requests.exists?
  end

  def pending?
    status == 'PENDING'
  end

  def approve!
    CatRentalRequest.transaction do
      update_attributes(status: 'APPROVED')
      deny!
    end
    puts 'Approval successful!'
  end

  def deny!
    overlapping_approved_requests.each { |request| request.update_attributes(status: 'DENIED') }
  end
end
