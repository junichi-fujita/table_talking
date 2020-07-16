FactoryBot.define do
  factory :user do
    name { 'testUser' }
    email { 'test@example.com' }
    password { 'aaaaaa' }
  end

  factory :second_user, class: User do
    name { 'secondUser' }
    email { 'second@example.com' }
    password { 'aaaaaa' }
  end
end