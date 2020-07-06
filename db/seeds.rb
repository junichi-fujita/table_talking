if Rails.env == "development"
  10.times do |i|
    Recruitment.create!(
      title: "test#{i}",
      content: "test_content#{i}",
      appropriate_level: "#{i}",
      start_time: "2020-07-6",
      play_time: "#{i}",
      master_name: "master#{i}",
    )
  end
end