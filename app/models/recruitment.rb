class Recruitment < ApplicationRecord
  has_many :participant_managements
  has_many :users, through: :participant_managements

  # def comment_for?(enrty)
  #   entry && entry.user != self & !comments.exists?()
  # end
end
