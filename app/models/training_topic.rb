class TrainingTopic < ApplicationRecord
  belongs_to :training_module
  has_many :training_pages
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
end
