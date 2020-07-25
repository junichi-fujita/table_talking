FactoryBot.define do
  factory :participant_management do
    # user_id { User.first.id }
    # recruitment_id { Recruitment.first.id }
    user
    recruitment
  end
  # factory :second_participant_management, class: ParticipantManagement do
  #   user_id { User.second.id }
  #   recruitment_id { Recruitment.second.id}
  # end
end