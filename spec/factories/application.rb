FactoryGirl.define do
  factory :wiki do
    name { Faker::HarryPotter.character }
    url { Faker::HarryPotter.quote }
    user
  end

end