FactoryBot.define do
  factory :participant_management do
    user
    recruitment
  end
  factory :second_participant_management, class: ParticipantManagement do
    second_user
    second_recruitment
  end
end