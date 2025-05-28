class TrainingPage < ApplicationRecord
  belongs_to :training_topic
  has_one_attached :photo
  validates :name, presence: true
end
