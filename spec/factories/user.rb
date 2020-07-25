FactoryBot.define do
  factory :user do
    name { 'test_user' }
    email { 'test@example.com' }
    password { 'aaaaaa' }
  end

  factory :second_user, class: User do
    name { 'second_user' }
    email { 'second@example.com' }
    password { 'aaaaaa' }
  end
end