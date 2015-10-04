require 'faker'
FactoryGirl.define do
  factory :bill do |f|
    f.title { Faker::Lorem.sentence }
    f.description { Faker::Lorem.sentence }
    f.day_of_month { rand(1..28) }
    f.total_amount { Faker::Number.decimal(2) }
  end
end