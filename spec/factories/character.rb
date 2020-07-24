FactoryBot.define do
  factory :character do
    name { 'text_name' }
    race { 0 }
    job { 0 }
    level { 1 }
    strength { 1 }
    agility { 2 }
    intelligence { 3 }
    attack { 1 }
    defense { 1 }
    evasion { 1 }
  end
end