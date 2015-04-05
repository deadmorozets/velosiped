FactoryGirl.define do
  factory :payment do
    amount { Faker::Number.positive(0.00, 2000.0) }
    date { 1.days.ago }
    association :person
  end

end