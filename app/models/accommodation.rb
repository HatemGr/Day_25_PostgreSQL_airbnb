class Accommodation < ApplicationRecord
  validates :available_beds,
    presence: true,
    numericality: {only_integer: true, greater_than: 0}

  validates :price,
    presence: true,
    numericality: {greater_than: 0}

  belongs_to :city
  belongs_to :admin, class_name: "User"
  has_many :bookings
  has_many :guests, through: :bookings
end
