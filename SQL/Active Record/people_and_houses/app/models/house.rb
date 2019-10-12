class House < ApplicationRecord
  validates :address, presence: true
  validate(:long_address)

  has_many(:persons, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Person
  })

  def long_address
    errors[:address] << 'Address is too short' unless address.length > 2
  end
end
