FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.characters(number: 40)}
    introduction       {Faker::Lorem.characters(number: 300)}
    genre_id           {rand(2..11)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
