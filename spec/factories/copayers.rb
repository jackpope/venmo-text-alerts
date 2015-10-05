FactoryGirl.define do
  factory :copayer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::Number.number(10) }
    amount { Faker::Number.decimal(2) }
    bill_id 1
  end

end
