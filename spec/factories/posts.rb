FactoryBot.define do
  factory :post do
    transient do
      person { Gimei.name }
    end
   name                 { Faker::Name.name }
   description          { Faker::Lorem.sentence }
   kind_id              { 2 }
   gender_id            { 2 }
   association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end   
  end
end
