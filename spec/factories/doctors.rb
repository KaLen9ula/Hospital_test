FactoryBot.define do
  factory :doctor do
    category
    user { association(:user, role: :doctor) }
  end
end

