if Rails.env == "development"
  
  10.times do |i|
    User.create!(
      name: "user#{i}",
      email: "user#{i}@example.com",
      password: "aaaaaa",
    )
  end

  %w(user0 user1 user2).each do |name|
    10.times do |i|
      recruitment = Recruitment.create!(
        title: "test#{i}",
        content: "test_content#{i}",
        appropriate_level: "#{i}",
        start_time: "2020-07-6",
        play_time: "#{i}",
        master_name: "user#{i}",
      )
      if i == 7 || i == 8 || 9
        %w(user3).each do |name2|
          user = User.find_by(name: name2)
          user.recruitments << recruitment
        end
      end
    end
  end

  

  # 10.times do |i|
  #   ParticipantManagement.create!(
  #     user_id: i,
  #     recruitment_id: i,
  #     acceptance: false,
  #     comment: "aaa#{i}",
  #   )
  # end
end