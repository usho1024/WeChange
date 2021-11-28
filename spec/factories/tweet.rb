FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.characters(number: 20) }
    user
  end
end
