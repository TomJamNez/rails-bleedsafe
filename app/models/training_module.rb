class TrainingModule < ApplicationRecord
  has_many :training_topics
  has_many :training_pages, through: :training_topics
  has_one_attached :photo
  validates :name, presence: true
end
