class Booking < ApplicationRecord
  include StartDateBeforeEndDateValidator
  include OverlappingDatesValidator

  belongs_to :listing

  validates :start_date, :end_date, presence: true
end
