require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :job do
    title 'software engineer'
    company 'google'
    city  'palo alto'
    state 'CA'
    country 'usa'
    description 'ninja programmer'
    url 'www.google.com'
    sequence(:job_key) { |n| "alpha#{n}" }
    user
  end
end
