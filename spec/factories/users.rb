FactoryBot.define do
  factory :user do
    nickname              {Faker::Lorem.characters(number: 10)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 4) + '1a'}
    password_confirmation {password}
    profile               {Faker::Lorem.characters(number: 200)}

    after(:build) do |user|
      user.avatar.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
