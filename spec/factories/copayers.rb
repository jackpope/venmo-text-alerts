FactoryGirl.define do
  factory :copayer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number }
    amount { Faker::Number.decimal(2) }
  end

end
