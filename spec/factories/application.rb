FactoryBot.define do
  factory :application do
    name { Faker::Simpsons.character }
    url { Faker::Simpsons.character }
    user
  end

end