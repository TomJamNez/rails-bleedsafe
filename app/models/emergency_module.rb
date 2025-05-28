class EmergencyModule < ApplicationRecord
  belongs_to :user
  has_many :emergency_topics
  has_many :emergency_pages, through: :emergency_topics

  validates :name, presence: true

end
