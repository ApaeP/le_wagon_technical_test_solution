class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show update destroy]

  def index
    listings = Listing.select(:id, :num_rooms)

    response = {listings:}
    render json: response, status: :ok
  end

  def show
    response = {
      id: @listing.id,
      num_rooms: @listing.num_rooms
    }
    render json: response, status: :ok
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      response = {
        id: @listing.id,
        num_rooms: @listing.num_rooms
      }
      render json: response, status: :created
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      response = {
        id: @listing.id,
        num_rooms: @listing.num_rooms
      }
      render json: response, status: :ok
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @listing.destroy
      render json: {}, status: :no_content
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
