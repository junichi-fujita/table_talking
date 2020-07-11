class Recruitment < ApplicationRecord
  has_many :participant_managements
  has_many :users, through: :participant_managements
end
