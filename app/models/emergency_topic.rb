class EmergencyTopic < ApplicationRecord
  belongs_to :emergency_module
  belongs_to :user
  has_many :emergency_pages
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true

end
