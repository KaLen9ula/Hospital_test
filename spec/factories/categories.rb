FactoryBot.define do
  factory :category do
    name { FFaker::Job.title }
  end
end


