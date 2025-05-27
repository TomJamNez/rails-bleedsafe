class EmergencyTopic < ApplicationRecord
  belongs_to :emergencymodule
  belongs_to :user
end
