class Person < ApplicationRecord
  validates :name, presence: true
  validates :house_id, presence: true
  validate(:long_name)

  belongs_to(:house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House
  })

  def long_name
    return unless name

    errors[:name] << 'is too short' unless name.length > 2
  end
end
