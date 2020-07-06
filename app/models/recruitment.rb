class Recruitment < ApplicationRecord
  has_many :participants, through: :participant_management, source: :user
end
