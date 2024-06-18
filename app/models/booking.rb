class Booking < ApplicationRecord
  include StartDateBeforeEndDateValidator
  include OverlappingDatesValidator

  belongs_to :listing

  validates :start_date, :end_date, presence: true

  after_create :create_missions

  private

  def create_missions
    listing.missions.create([
      {
        date: start_date,
        mission_type: :first_checkin,
        price: 10 * listing.num_rooms
      },
      {
        date: end_date,
        mission_type: :last_checkout,
        price: 5 * listing.num_rooms
      }
    ])
  end
end
