module StartDateBeforeEndDateValidator
  extend ActiveSupport::Concern

  included do
    validate :start_date_before_end_date
  end

  private

  def start_date_before_end_date
    return if start_date.blank? || end_date.blank?
    return if start_date < end_date

    errors.add(:start_date, 'must be before end date')
  end
end
