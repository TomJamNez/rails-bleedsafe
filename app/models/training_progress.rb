class TrainingProgress < ApplicationRecord
  belongs_to :user
  belongs_to :training_topic
end
