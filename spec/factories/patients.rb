FactoryBot.define do
  factory :patient do
    user { association(:user, role: :patient) }
  end
end

