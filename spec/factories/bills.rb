require 'faker'
FactoryGirl.define do
  factory :bill do |f|
    f.title { Faker::Lorem.sentence }
    f.description { Faker::Lorem.sentence }
    f.due_date Date.tomorrow
    f.total_amount { Faker::Number.decimal(2) }
  end
end