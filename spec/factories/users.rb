FactoryBot.define do
  factory :user do
    phone_num { FFaker::PhoneNumber.phone_number }
    password { FFaker::Internet.password }
    role { :user }
  end
end
