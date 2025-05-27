class EmergencyPage < ApplicationRecord
  belongs_to :emergencytopic
  belongs_to :user
end
