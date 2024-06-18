class Reservation < ApplicationRecord
  include StartDateBeforeEndDateValidator
  include OverlappingDatesValidator
  include DestroyMissions

  belongs_to :listing

  validates :start_date, :end_date, presence: true

  after_create :create_missions

  private

  def create_missions
    return if listing.missions.exists?(date: end_date, mission_type: :last_checkout)

    listing.missions.create(
      date: end_date,
      mission_type: :checkout_checkin,
      price: 10 * listing.num_rooms
    )
  end
end
