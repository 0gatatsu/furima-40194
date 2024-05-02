FactoryBot.define do
  factory :item do

    name {Faker::Name.initials(number: 2)}
    price { 500 }
    content {Faker::Lorem.sentence}
    user_id { @user }
    genre_id { 1 }
    quality_id { 1 }
    payment_id { 1 }
    prefecture_id { 1 }
    day_id { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
