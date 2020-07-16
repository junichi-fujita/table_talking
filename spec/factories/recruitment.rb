FactoryBot.define do
  factory :recruitment do
    title { 'test_title' }
    content { 'test_content' }
    appropriate_level { 1 }
    master_name { 'test_master' }
    start_time { DateTime.now + 1}
    play_time { 2 }
  end
  factory :second_recruitment, class: Recruitment do
    title { 'second_title' }
    content { 'second_content' }
    appropriate_level { 2 }
    master_name { 'second_master' }
    start_time { DateTime.now + 2 }
    play_time { 3 }
  end
end