if Rails.env == "development"
  10.times do |i|
    Recruitment.create!(
      id: i,
      title: "test#{i}",
      content: "test_content#{i}",
      appropriate_level: "#{i}",
      start_time: "2020-07-6",
      play_time: "#{i}",
      master_name: "master#{i}",
    )
  end

  10.times do |i|
    User.create!(
      id: i,
      name: "user#{i}",
      email: "user#{i}@example.com",
      password: "aaaaaa",
    )
  end

  10.times do |i|
    ParticipantManagement.create!(
      user_id: i,
      recruitment_id: i,
      acceptance: false,
      comment: "aaa#{i}",
    )
  end
end