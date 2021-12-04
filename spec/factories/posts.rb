FactoryBot.define do
  factory :post do
    title   { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.sentences }
    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/sample-image1.png'), filename: 'sample-image1.png')
    end
  end
end
