FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
  end
end
