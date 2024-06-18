class Mission < ApplicationRecord
  belongs_to :listing

  enum mission_type: { first_checkin: 0, last_checkout: 1, checkout_checkin: 2 }

  validates :date, :mission_type, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
