FactoryBot.define do
  factory :application do
    name { Faker::HarryPotter.character }
    url { Faker::HarryPotter.quote }
    user
  end

end