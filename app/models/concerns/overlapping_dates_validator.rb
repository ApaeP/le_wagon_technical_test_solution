module OverlappingDatesValidator
  extend ActiveSupport::Concern

  included do
    validate :overlapping_dates
  end

  private

  def overlapping_dates
    overlappings = self.class.where(listing_id: listing_id)
      .where.not(id: id)
      .where('start_date < :end_date AND end_date > :start_date', end_date:, start_date:)

    return unless overlappings.exists?

    errors.add(:base, "Dates overlap with existing #{self.class.name.downcase}")
  end
end
