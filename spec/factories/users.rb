FactoryGirl.define do
  factory :valid_user do
    first_name Faker::Name.first_name
    last_name Faker::Name.lasat_name
    status "offline"
    personal_status Faker::Lorem.sentence
    email Faker::Internet.email
    tokens Faker::Crypto.md5
  end
  factory :invalid_user do
    first_name Faker::Name.first_name
    last_name Faker::Name.lasat_name
    status "offline"
    personal_status Faker::Lorem.sentence
    email "abcdefg"
    tokens Faker::Crypto.md5
  end
end
