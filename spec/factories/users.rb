FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation {password} 
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    prefecture_id         { 2 }
    introduction          { Faker::Lorem.sentence } 
  end
end