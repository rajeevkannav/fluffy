FactoryBot.define do
  factory :todo do
    title {Faker::Lorem.word}
    is_deleted {false}
  end
end