FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
    f.confirmed_at Time.now
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.venmo_user_name { Faker::Internet.user_name }
  end

end
