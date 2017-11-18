FactoryBot.define do
  factory :user do
    name RandomData.random_name
    sequence(:email){|n| "user#{n}@factory.com" }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end