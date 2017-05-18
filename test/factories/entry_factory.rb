# frozen_string_literal: true

FactoryGirl.define do
  factory :entry do
    association :admin
    title Faker::Lorem.sentence(5, false, 0)
    content Faker::Lorem.sentence(3, false)
    favorite false
  end
end
