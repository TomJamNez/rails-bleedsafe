class Faq < ApplicationRecord
  acts_as_list
  validates :question, presence: true
  validates :answer, presence: true
end
