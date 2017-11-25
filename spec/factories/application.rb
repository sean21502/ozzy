FactoryBot.define do
  factory :application do
    name Faker::Name.name
    url Faker::Name.name
    user
  end
end