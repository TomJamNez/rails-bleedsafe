class TrainingPage < ApplicationRecord
  belongs_to :training_topic
  validates :title, presence: true
  validates :step, presence: true
  has_one_attached :photo

  # below is for pundit
  # scope :active, -> { where(active: true) }
  # scope :inactive, -> { where(active: false) }
end
