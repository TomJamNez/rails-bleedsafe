class FirstAidMap < ApplicationRecord
  # belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, numericality { allow_nil: true }
  validates :longitude, numericality { allow_nil: true }
  validates :category, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
