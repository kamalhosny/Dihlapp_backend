FactoryGirl.define do
  factory :conversation_member do
    conversation_id Faker::Number.between(1, 10)
    user_id Faker::Number.between(1, 10)
    seen_at "2017-06-18 14:16:13"
  end
end