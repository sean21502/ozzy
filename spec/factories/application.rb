FactoryBot.define do
  factory :application do
    name RandomData.random_name
    url RandomData.random_sentence
    user
  end
end