class Listing < ApplicationRecord
  validates :num_rooms, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
