class EmergencyPage < ApplicationRecord
  belongs_to :emergency_topic
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true
  validates :step, presence: true

end
