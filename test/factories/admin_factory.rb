# frozen_string_literal: true

FactoryGirl.define do
  factory :admin do
    sequence(:username)   { |n| "admin#{n}" }
    sequence(:first_name) { |n| "#{Faker::Name.first_name}#{n}" }
    last_name             Faker::Name.last_name
    sequence(:email)      { |_n| "#{username}@example.com" }
    password              'password123'
  end
end
