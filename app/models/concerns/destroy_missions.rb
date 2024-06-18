module DestroyMissions
  extend ActiveSupport::Concern

  included do
    after_destroy :destroy_missions
  end

  private

  def destroy_missions
    listing.missions.where('date >= :start_date AND date <= :end_date', start_date:, end_date:).destroy_all
  end
end
