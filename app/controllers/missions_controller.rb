class MissionsController < ApplicationController
  def index
    missions = Mission.select(:listing_id, :mission_type, :date, :price)

    response = {missions:}
    render json: response, status: :ok
  end
end
