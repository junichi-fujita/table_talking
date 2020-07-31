names = %w(赤添衛門 敦実親王 安倍清行 阿保経覧 在原滋春 在原業平 在原棟梁 在原元方 在原行平 粟田口忠良 安法 伊賀少将 和泉式部 伊勢大輔 殷富門院大輔 宇都宮頼綱 馬内侍 恵慶 大江為基 大江千里)

titles = %w(
  ゴブリン退治 
  まったりプレイ 
  ダンジョン探索 
  宝探し 
  人助け 
  謎解き 
)
20.times do |i|
  User.create!(
    name: names[i],
    email: "test#{i}@example.com",
    password: "aaaaaa",
  )
end

20.times do |i|
  title_content = titles.sample
  recruitment = Recruitment.create!(
    title: title_content,
    content: "#{title_content}します！！",
    appropriate_level: "#{i + 1}",
    start_time: "2020-08-6",
    play_time: "#{i + 1}",
    master_name: names[i],
  )
end
num = %w(0..19)

20.times do |i|
  ParticipantManagement.create(
    user_id: "#{num.sample}",
    recruitment_id: "#{num.sample}"
  )
end