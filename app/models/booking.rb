class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validate :start_must_be_before_end_time, :overlaping_reservation?

  belongs_to :guest, class_name: "User"
  belongs_to :accommodation

  def start_must_be_before_end_time
    valid = self.start_date.to_i <= self.end_date.to_i
    errors.add(:start_date, "star must be before end time") unless valid
  end

  def overlaping_reservation?
    Booking.all.where(accommodation: self.accommodation).each do |book|
      return errors.add(:start_date, "is overlapping on another booking") unless (self.start_date >= book.end_date || self.end_date <= book.start_date) || book == self
    end
  end

  def price
    nbr_day = (self.end_date - self.start_date)/24/60/60
    return nbr_day*self.accommodation.price
  end

  def duration
    return (self.end_date - self.start_date)/24/60/60
  end


end
